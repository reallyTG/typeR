library(psych)


### Name: scatterHist
### Title: Draw a scatter plot with associated X and Y histograms,
###   densities and correlation
### Aliases: scatter.hist scatterHist
### Keywords: multivariate hplot

### ** Examples

data(sat.act)
with(sat.act,scatter.hist(SATV,SATQ))
#or for something a bit more splashy
scatter.hist(sat.act[5:6],pch=(19+sat.act$gender),col=c("blue","red")[sat.act$gender],grid=TRUE)



