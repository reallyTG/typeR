library(popbio)


### Name: reproductive.value
### Title: Stable stage distribution
### Aliases: reproductive.value
### Keywords: survey

### ** Examples


data(teasel)
v<-reproductive.value(teasel)
v
dotchart(log10(v), pch=16, xlab="Reproductive value (log10)")




