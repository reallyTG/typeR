library(antitrust)


### Name: HHI
### Title: Herfindahl-Hirschman Index
### Aliases: HHI

### ** Examples


## Consider a market with 5 products labeled 1-5. 1,2 are produced
## by Firm A, 2,3 are produced by Firm B, 3 is produced by Firm C.
## The pre-merger product market shares are

shares = c(.15,.2,.25,.35,.05)
owner  = c("A","A","B","B","C")
nprod  = length(shares)

HHI(shares,owner)

## Suppose that Firm A acquires a 75% ownership stake in product 3, and
## Firm B get a 10% ownership stake in product 1. Assume that neither
## firm cedes control of the product to the other.

owner <- diag(nprod)

owner[1,2] <- owner[2,1] <- owner[3,4] <- owner[4,3] <- 1
control <- owner
owner[1,1] <- owner[2,1] <- .9
owner[3,1] <- owner[4,1] <- .1
owner[1,3] <- owner[2,3] <- .75
owner[3,3] <- owner[4,3] <- .25

HHI(shares,owner,control)

## Suppose now that in addition to the ownership stakes described
## earlier, B receives 30% of the control of product 1
control[1,1] <- control[2,1] <- .7
control[3,1] <- control[4,1] <- .3

HHI(shares,owner,control)





