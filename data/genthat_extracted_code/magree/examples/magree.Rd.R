library(magree)


### Name: magree
### Title: O'Connell-Dobson-Schouten estimators for multiobserver
###   agreement.
### Aliases: magree
### Keywords: Agreement Kappa

### ** Examples


## Table 1 (O'Connell and Dobson, 1984)
summary(fit <- magree(landis, weights="unweighted"))
update(fit, weights="linear")
update(fit, weights="quadratic")

## Table 5, O'Connell and Dobson (1984)
magree(landis==1)
magree(landis==2)
magree(landis==3)
magree(landis==4)
magree(landis==5)

## Plot of the marginal distributions
plot(fit) 

## Plot of the average agreement by observer
plot(fit, type="kappa by observer") 



