library(Ecdat)


### Name: USclassifiedDocuments
### Title: Official Secrecy of the United States Government
### Aliases: USclassifiedDocuments
### Keywords: datasets

### ** Examples

##
## 1.  plot DerivClassActivity 
##
plot(DerivClassActivity~year, USclassifiedDocuments)
#  Exponential growth?  

plot(DerivClassActivity~year, USclassifiedDocuments, 
     log='y')
# A jump in 2009 as discussed by Fitzpatrick (2013).  
# Otherwise plausibly a straight line.   

##
## 2.  First difference? 
##
plot(diff(log(DerivClassActivity))~year[-1], 
     USclassifiedDocuments)
# Jump in 2009 but otherwise on distribution 

##
## 3.  autocorrelation?  
##
sel <- with(USclassifiedDocuments, 
            (1995 < year) & (year < 2009) )
acf(diff(log(USclassifiedDocuments$
             DerivClassActivity[sel])))
# lag 1 autocorrelation = (-0.52).  
# However, with only 12 numbers, 
# this is not statistically significant.  



