library(derivmkts)


### Name: binom
### Title: Binomial option pricing
### Aliases: binom binomopt binomplot binomial

### ** Examples

s=40; k=40; v=0.30; r=0.08; tt=0.25; d=0; nstep=15

binomopt(s, k, v, r, tt, d, nstep, american=TRUE, putopt=TRUE)

binomopt(s, k, v, r, tt, d, nstep, american=TRUE, putopt=TRUE,
    returnparams=TRUE)

## matches Fig 10.8 in 3rd edition of Derivatives Markets
x <- binomopt(110, 100, .3, .05, 1, 0.035, 3, american=TRUE,
    returntrees=TRUE, returnparams=TRUE)
print(x$oppricretree)
print(x$delta)
print(x$bond)

binomplot(s, k, v, r, tt, d, nstep, american=TRUE, putopt=TRUE)

binomplot(s, k, v, r, tt, d, nstep, american=FALSE, putopt=TRUE)





