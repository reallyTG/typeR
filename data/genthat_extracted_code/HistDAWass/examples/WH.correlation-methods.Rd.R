library(HistDAWass)


### Name: WH.correlation
### Title: Method WH.correlation
### Aliases: WH.correlation WH.correlation,MatH-method

### ** Examples

WH.correlation(BLOOD)
# generate a set of random weights
RN<-runif(get.MatH.nrows(BLOOD))
WH.correlation(BLOOD,w=RN)



