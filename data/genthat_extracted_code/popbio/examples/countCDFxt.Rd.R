library(popbio)


### Name: countCDFxt
### Title: Count-based extinction probabilities and bootstrap confidence
###   intervals
### Aliases: countCDFxt
### Keywords: survey

### ** Examples

## plot like Figure 3.8 in Morris and Doak (2002).
data(grizzly)
logN<-log(grizzly$N[-1]/grizzly$N[-39])
countCDFxt(mu=mean(logN), sig2=var(logN), nt=38, tq=38, Nc=99, Ne=20)



