library(OpenRepGrid)


### Name: constructRmsCor
### Title: Root mean square (RMS) of inter-construct correlations.
### Aliases: constructRmsCor

### ** Examples


   # data from grid manual by Fransella, Bell and Bannister
   constructRmsCor(fbb2003)    
   constructRmsCor(fbb2003, trim=20)
   
   # modify output
   r <- constructRmsCor(fbb2003) 
   print(r, digits=5)
   # access calculation results
   r[2, 1]




