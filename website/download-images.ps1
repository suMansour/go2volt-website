$imageUrls = @{
    "hero-bg.jpg" = "https://placehold.co/1200x800/2563EB/FFFFFF/png?text=Security+Solutions"
    "about-company.jpg" = "https://placehold.co/800x600/2563EB/FFFFFF/png?text=About+Us"
    "cctv.jpg" = "https://placehold.co/600x400/2563EB/FFFFFF/png?text=CCTV"
    "access-control.jpg" = "https://placehold.co/600x400/2563EB/FFFFFF/png?text=Access+Control"
    "access-gates.jpg" = "https://placehold.co/600x400/2563EB/FFFFFF/png?text=Access+Gates"
    "alarm.jpg" = "https://placehold.co/600x400/2563EB/FFFFFF/png?text=Alarm+Systems"
    "barriers.jpg" = "https://placehold.co/600x400/2563EB/FFFFFF/png?text=Barriers"
    "fire-alarm.jpg" = "https://placehold.co/600x400/2563EB/FFFFFF/png?text=Fire+Alarm"
}

# Create images directory if it doesn't exist
if (-not (Test-Path "images")) {
    New-Item -ItemType Directory -Path "images"
}

# Download each image
foreach ($image in $imageUrls.GetEnumerator()) {
    $outputPath = Join-Path "images" $image.Key
    Write-Host "Downloading $($image.Key)..."
    try {
        Invoke-WebRequest -Uri $image.Value -OutFile $outputPath
        Write-Host "Successfully downloaded $($image.Key)"
    }
    catch {
        Write-Host "Failed to download $($image.Key): $_"
    }
} 