library(sads)


### Name: octavpred-methods
### Title: Predicted frequencies of species in octaves
### Aliases: octavpred
###   octavpred,fitrad,missing,missing,missing,missing,ANY,missing,missing-method
###   octavpred,fitsad,missing,missing,missing,missing,ANY,missing,missing-method
###   octavpred,missing,character,missing,list,ANY,ANY,numeric,numeric-method
###   octavpred,missing,missing,character,list,ANY,ANY,numeric,numeric-method
###   octavpred,numeric,character,missing,list,ANY,ANY,missing,missing-method
###   octavpred,numeric,missing,character,list,ANY,ANY,missing,missing-method
### Keywords: methods

### ** Examples

## Predicted frequencies from a fitted model
## meta-community zero-sum multinomial for BCI data
bci.mzsm <- fitsad(bci, "mzsm")
bci.mzsm.oc <- octavpred(bci.mzsm)
## Preston plot with observed and predicted frequencies
plot(octav(bci))
lines(bci.mzsm.oc)
## Alternative model: local zero-sum multinomial
## Alonso & Mckane (Ecol. Lett. 2004, table 1) give theta = 44 and m = 0.15
bci.lzsm.oc <- octavpred( bci, sad = "volkov", coef =list(theta = 44, m = 0.15, J=sum(bci)) )
## Adding predicted frequencies to the plot
lines(bci.lzsm.oc, col = "red")



