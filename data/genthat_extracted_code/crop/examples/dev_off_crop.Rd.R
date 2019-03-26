library(crop)


### Name: dev_off_crop
### Title: Cropping Device
### Aliases: dev.off.crop
### Keywords: utilities

### ** Examples

## Example data
x <- 1:10
y <- rev(x)

## PS
postscript(file=(file <- "crop.ps"))
plot(x, y, xlab="x", ylab="y")
dev.off.crop(file=file)

## EPS
setEPS() # or use onefile=FALSE, horizontal=FALSE, paper="special" in postscript()
postscript(file=(file <- "crop.eps"))
plot(x, y, xlab="x", ylab="y")
dev.off.crop(file=file)

## PDF
pdf(file=(file <- "crop.pdf"))
plot(x, y, xlab="x", ylab="y")
dev.off.crop(file=file)

## PNG with white background
png(filename=(file <- "crop.png"))
plot(x, y, xlab="x", ylab="y")
dev.off.crop(file=file)

## PNG with transparent background
## Not doable by the underlying 'mogrify' (only cropped vertically, not horizontally)
if(FALSE) {
    png(filename=(file <- "crop.png"), bg="transparent")
    plot(x, y, xlab="x", ylab="y")
    dev.off.crop(file=file)
}



