library(fastcmh)


### Name: makefastcmhdata
### Title: Create sample data for fastcmh
### Aliases: makefastcmhdata

### ** Examples

#make a small sample data set, using the default parameters
mylist <- makefastcmhdata(showOutput=TRUE, saveToList=TRUE)

#make a very small sample data set
mylist <- makefastcmhdata(n=20, L=10, tau1=2, taulength1=2,
       tau2=6, taulength2=2, saveToList=TRUE)



