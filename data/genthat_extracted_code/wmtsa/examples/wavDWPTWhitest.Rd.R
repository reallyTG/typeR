library(wmtsa)


### Name: wavDWPTWhitest
### Title: Seeks the whitest transform of a discrete wavelet packet
###   transform (DWPT)
### Aliases: wavDWPTWhitest
### Keywords: datagen

### ** Examples

## calculate the DWPT of the sunspots series 
W <- wavDWPT(as.numeric(sunspots), wavelet="s8", n.levels=9)

## find the whitest transform based on the 
## Portmanteau I white noise test 
z <- wavDWPTWhitest(W, test="port1")

print(z)



