library(STAND)


### Name: IH.summary
### Title: Summary Statistic for Samples With Non-detects
### Aliases: IH.summary
### Keywords: htest

### ** Examples

# Analysis for cansdata  Example 1 from ORNLTM2005-52
data(cansdata)
Allcans<- round(IH.summary(cansdata,L=0.2,bcol=NA),3)
# Example using cansdata with By variable
cansout <- round(IH.summary(cansdata,L=0.2,bcol=3),3)
#  combine out from both analysis
cbind(Allcans,cansout)



