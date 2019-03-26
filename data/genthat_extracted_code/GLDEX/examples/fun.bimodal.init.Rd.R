library(GLDEX)


### Name: fun.bimodal.init
### Title: Finds the initial values for optimisation in fitting the bimodal
###   generalised lambda distribution.
### Aliases: fun.bimodal.init
### Keywords: smooth

### ** Examples

## Split the first column of the faithful data into two using 
## fun.class.regime.bi
# faithful1.mod<-fun.class.regime.bi(faithful[,1], 0.1, clara)

## Save the datasets
# qqqq1.faithful1.cc1<-faithful1.mod$data.a
# qqqq2.faithful1.cc1<-faithful1.mod$data.b

## Find the initial values for secondary optimisation.
# result.faithful1.init1<-fun.bimodal.init(data1=qqqq1.faithful1.cc1,
# data2=qqqq2.faithful1.cc1, rs.leap1=3,fmkl.leap1=3,rs.init1 = c(-1.5, 1.5), 
# fmkl.init1 = c(-0.25, 1.5), rs.leap2=3,fmkl.leap2=3,rs.init2 = c(-1.5, 1.5), 
# fmkl.init2 = c(-0.25, 1.5))

## These initial values are then passed onto fun,bimodal.fit.ml to obtain the 
## final fits.



