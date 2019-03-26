library(paleoMAS)


### Name: dispersion.all
### Title: Taxon response to environmental variables through LOESS
###   regression
### Aliases: dispersion.all
### Keywords: models robust smooth

### ** Examples

data(modernq)
# Calculate percentages
perq<-percenta(modernq,first=2,last=39)[,2:55]
# filter data set to include only samples with at least 0.5
# percent in 20 percent of the samples
perq1<-filter.p(perq,presen=0.5,persist=0.2)$filtered
# calculate alpha and degree for each taxon through AIC
a.d<-akaike.all(modernq[,1],perq1)
# evaluate dispersion and residuals for each loess regression
dispersion.all(modernq[,1],perq1,a.d,trials=c(50,0.1),delta=25)



