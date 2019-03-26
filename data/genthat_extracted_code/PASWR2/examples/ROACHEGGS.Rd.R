library(PASWR2)


### Name: ROACHEGGS
### Title: Oriental Cockroaches
### Aliases: ROACHEGGS
### Keywords: datasets

### ** Examples

p <- seq(0.1, 0.9, 0.001) 
negloglike <- function(p){ 
-(sum(ROACHEGGS$eggs)*log(p) + sum(1-ROACHEGGS$eggs)*log(1-p))
}
nlm(negloglike, .2)
rm(p, negloglike)



