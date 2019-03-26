library(MFT)


### Name: MFT.peaks
### Title: MFT.peaks
### Aliases: MFT.peaks

### ** Examples

# Normal distributed sequence with 2 peaks
set.seed(12)
m <- c(rep(0,30),seq(0,3,length.out = 100),seq(3,0,length.out = 80),rep(0,10),
       seq(0,6,length.out = 50),seq(6,0,length.out = 50),rep(0,30))
x <- rnorm(length(m),m)
mft <- MFT.peaks(x)
plot(mft)
# Set additional parameters (window set)
mft <- MFT.peaks(x,autoset.H = FALSE, H =c(30,60,90))
plot(mft)




