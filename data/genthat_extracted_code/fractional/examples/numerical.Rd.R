library(fractional)


### Name: numerical
### Title: Convert a fractional object to the equivalent numeric object
### Aliases: numerical numerical.charFrac numerical.default
###   numerical.fractional

### ** Examples

suppressPackageStartupMessages(library(dplyr))
m <- 2*diag(5)
m[abs(row(m) - col(m)) == 1] <- -1
m  ## How much roundoff error does inverting entail?
(mi  <- solve(m) %>% fractional) ## patterned inverse
mi * max(denominators(mi)) ## clearer pattern
m1 <- solve(mi)
range(m1 - m)           ## roundoff still present
m2 <- m1 %>% numerical  ## remove roundoff error - hopefully!
identical(m2, m)        ## no roundoff



