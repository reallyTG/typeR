library(magree)


### Name: schouten
### Title: Schouten estimators for multiobserver agreement.
### Aliases: schouten
### Keywords: Agreement Kappa

### ** Examples


## Weights matrix used by Schouten (1982)
w <- outer(1:5,1:5,function(x,y) ((x<=2 & y<=2) | (x>=3 & y>=3))+0)
fit <- schouten(landis,w=w) # user-defined weights

summary(fit) # Schouten (1982), Tables 2 and 5

## we can fit the same model with oconnell() or magree() using the score argument
magree(landis,score=c(1,1,2,2,2))

## plot of the average kappas by observer
plot(fit, type="kappa by observer")



