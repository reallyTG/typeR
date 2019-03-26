library(OpenRepGrid)


### Name: elementRmsCor
### Title: Root mean square (RMS) of inter-element correlations.
### Aliases: elementRmsCor

### ** Examples


   # data from grid manual by Fransella, Bell and Bannister
   elementRmsCor(fbb2003)    
   elementRmsCor(fbb2003, trim=10)
   
   # modify output
   r <- elementRmsCor(fbb2003) 
   print(r, digits=5)

   # access second row of calculation results
   r[2, "RMS"]




