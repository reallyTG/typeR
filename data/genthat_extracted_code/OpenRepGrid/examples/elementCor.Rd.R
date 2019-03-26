library(OpenRepGrid)


### Name: elementCor
### Title: Calculate the correlations between elements.
### Aliases: elementCor

### ** Examples


   elementCor(mackay1992)                      # Cohen's rc
   elementCor(mackay1992, rc=FALSE)            # PM correlation
   elementCor(mackay1992, rc=FALSE, method="spearman")  # Spearman correlation

   # format output
   elementCor(mackay1992, trim=6)
   elementCor(mackay1992, index=FALSE, trim=6)

   # save as object for further processing
   r <- elementCor(mackay1992)
   r
   
   # change output of object
   print(r, digits=5)
   print(r, col.index=FALSE)
   print(r, upper=FALSE)
   
   # accessing elements of the correlation matrix
   r[1,3]
   



