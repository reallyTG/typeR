library(TSdist)


### Name: ERPDistance
### Title: Edit Distance with Real Penalty (ERP).
### Aliases: ERPDistance

### ** Examples


#The objects example.series3 and example.series4 are two 
#numeric series of length 100 and 120 contained in the TSdist  
#package. 

data(example.series3)
data(example.series4)

#For information on their generation and shape see 
#help page of example.series.

help(example.series)

#Calculate the ERP distance for two series of different length
#with no windowing constraint:

ERPDistance(example.series3, example.series4, g=0)

#Calculate the ERP distance for two series of different length
#with a window of size 30:

ERPDistance(example.series3, example.series4, g=0, sigma=30)




