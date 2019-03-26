library(Kendall)


### Name: GuelphP
### Title: Phosphorous Concentrations in Speed River, Monthly
### Aliases: GuelphP
### Keywords: datasets

### ** Examples

data(GuelphP)
plot(GuelphP)
#replace missing values in the series with estimates obtained from Hipel and McLeod
# (2005, p. 986)
missingEst<-c(0.1524, 0.2144, 0.3064, 0.1342)
GuelphP2<-GuelphP
GuelphP2[is.na(GuelphP)]<-missingEst



