library(OpenRepGrid)


### Name: constructCor
### Title: Calculate correlations between constructs.
### Aliases: constructCor

### ** Examples


   # three different types of correlations
   constructCor(mackay1992)                
   constructCor(mackay1992, method="kendall")
   constructCor(mackay1992, method="spearman")

   # format output
   constructCor(mackay1992, trim=6)
   constructCor(mackay1992, index=TRUE, trim=6)
   
   # save correlation matrix for further processing
   r <- constructCor(mackay1992)
   r
   print(r, digits=5)
   
   # accessing the correlation matrix
   r[1, 3]




