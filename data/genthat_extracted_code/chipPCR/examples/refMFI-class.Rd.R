library(chipPCR)


### Name: refMFI
### Title: Class '"refMFI"'
### Aliases: refMFI-class refMFI show,refMFI-method qqline,refMFI-method
###   qqnorm,refMFI-method show,refMFI-method
### Keywords: classes

### ** Examples

data(VIMCFX96_60)

res <- MFIaggr(VIMCFX96_60)
#summarize analysis
summary(res)
#plot results of the analysis
plot(res)
#plot a QQ plot
qqnorm(res)
#add QQ line
qqline(res)



