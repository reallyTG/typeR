library(sads)


### Name: radpred-methods
### Title: Predicted ranked abundance of species
### Aliases: radpred
###   radpred,fitrad,missing,missing,missing,missing,missing,missing,missing-method
###   radpred,fitsad,missing,missing,missing,missing,missing,missing,missing-method
###   radpred,missing,character,missing,list,ANY,ANY,numeric,numeric-method
###   radpred,missing,missing,character,list,ANY,missing,numeric,numeric-method
###   radpred,numeric,character,missing,list,ANY,ANY,missing,missing-method
###   radpred,numeric,missing,character,list,ANY,missing,missing,missing-method
### Keywords: methods

### ** Examples

## Predicted frequencies from a fitted model
## meta-community zero-sum multinomial for BCI data
moths.mzsm <- fitsad(moths, "mzsm")
moths.mzsm.r <- radpred(moths.mzsm)
## Rank-abundance plot with observed and predicted frequencies
plot(rad(moths))
lines(moths.mzsm.r)
## Alternative model: local zero-sum multinomial
## Alonso & Mckane (Ecol. Lett. 2004, table 1) give theta = 41 and m = 0.77
moths.lzsm.r <- 
  radpred( moths, sad = "volkov",  
           coef =list(theta = 41, m = 0.77, J=sum(moths)) 
         )
## Adding predicted frequencies to the plot
lines(moths.lzsm.r, col = "red")



