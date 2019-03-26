library(echogram)


### Name: mask.echogram
### Title: Mask an echogram
### Aliases: mask.echogram
### Keywords: manip

### ** Examples


# import 38 kHz data from HAC file
hacfile <- system.file("hac", "D20150510-T202500.hac", package = "echogram")
echo2.038 <- read.echogram(hacfile, channel = 1)

# make a copy of the original echogram
tmp <- echo2.038

# Create a mask, which is a matrix with 1's and NA's 
mask <- mask.echogram(tmp, surf.off = 1, bott.off = -1, mask = FALSE)
image(t(mask[nrow(mask):1, ])) 

# Apply mask to echogram
tmp$Sv <- tmp$Sv * mask 
echogram(tmp)

# By default, the function returns the masked echogram
echo2.038mask <- mask.echogram(echo2.038, surf.off = 2, bott.off = 0.2)
echogram(echo2.038mask)



