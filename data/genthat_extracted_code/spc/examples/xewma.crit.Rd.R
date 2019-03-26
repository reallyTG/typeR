library(spc)


### Name: xewma.crit
### Title: Compute critical values of EWMA control charts
### Aliases: xewma.crit
### Keywords: ts

### ** Examples

l <- .1
incontrolARL <- c(500,5000,50000)
sapply(incontrolARL,l=l,sided="two",xewma.crit,r=35) # accuracy with 35 nodes
sapply(incontrolARL,l=l,sided="two",xewma.crit)      # accuracy with 40 nodes
sapply(incontrolARL,l=l,sided="two",xewma.crit,r=50) # accuracy with 50 nodes

## Crowder (1989)
## two-sided EWMA control charts with fixed limits

l <- c(.05,.1,.15,.2,.25)
L0 <- 250
round(sapply(l,L0=L0,sided="two",xewma.crit),digits=2)

## original values are 2.32, 2.55, 2.65, 2.72, and 2.76.



