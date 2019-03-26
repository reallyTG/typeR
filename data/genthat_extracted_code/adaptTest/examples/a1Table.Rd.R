library(adaptTest)


### Name: a1Table
### Title: Function to produce tables of alpha1
### Aliases: a1Table

### ** Examples

## Produce basic reference tables for the test by Vandemeulebroecke (2006)
alpha  <- c(0.1, 0.05, 0.025, 0.01)
alpha0 <- 1:10/10
a1Table(typ="v", a=alpha, a0=alpha0, Pocock=FALSE)
a1Table(typ="v", a=alpha, a0=alpha0, Pocock=TRUE)



