library(PASWR)


### Name: Roacheggs
### Title: Oriental Cockroaches
### Aliases: Roacheggs
### Keywords: datasets

### ** Examples

p <- seq(0.1, 0.9, 0.001)
negloglike <- function(p){
-(sum(Roacheggs$eggs)*log(p) + sum(1-Roacheggs$eggs)*log(1-p))
}
nlm(negloglike, .2)
rm(negloglike)



