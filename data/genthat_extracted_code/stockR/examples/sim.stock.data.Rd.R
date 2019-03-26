library(stockR)


### Name: sim.stock.data
### Title: Simulates SNP data according to stockSTRUCTURE model
### Aliases: sim.stock.data

### ** Examples

#a data set with 100 individuals, from 100 different sampling groups (so no individual
#can be assumed a priori to belong to the same stock as any other individual), with 
#5000 SNP markers. There are 3 stocks and only 200 of the 500 SNP markers are 
#differentiated between stocks.
myData <- sim.stock.data( nAnimal=100, nSNP=5000, nSampleGrps=100, K=3, ninform=200)
print( dim( myData))  #should be 5000 x 100



