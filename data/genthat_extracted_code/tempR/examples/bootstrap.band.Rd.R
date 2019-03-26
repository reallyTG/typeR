library(tempR)


### Name: bootstrap.band
### Title: Get bootstrap confidence bands for attribute selections
### Aliases: bootstrap.band

### ** Examples

x <- ojtcata[ojtcata$samp == 1 & ojtcata$attribute == "Sweetness",  -c(1:4)]
x.boot.ci <- bootstrap.band(x, boot = 99) # 99 is only for illustrative purposes
x.boot.ci



