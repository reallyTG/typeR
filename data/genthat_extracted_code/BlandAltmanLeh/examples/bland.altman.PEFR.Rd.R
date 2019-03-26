library(BlandAltmanLeh)


### Name: bland.altman.PEFR
### Title: PEFR Data from Bland JM and Altman DG 1986
### Aliases: bland.altman.PEFR
### Keywords: datasets

### ** Examples

# this is what fig. 1. would have looked like in R:
x <- bland.altman.PEFR[["bigger.first"]]
y <- bland.altman.PEFR[["smaller.first"]]
plot(x,y, xlab="PEFR by large meter",ylab="PEFR by mini meter", 
     xlim=c(0,800), ylim=c(0,800))
abline(0,1)



