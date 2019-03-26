library(braidrm)


### Name: invertBRAIDrsm
### Title: Invert BRAID Response Function
### Aliases: invertBRAIDrsm
### Keywords: regression

### ** Examples

level <- 90
doses <- c(0,10^-8,10^-7,10^-6)
ec90A <- invertBRAIDrsm(level,DB=doses,parv=c(10^-6,10^-6,1.5,1.5,1,1.8,0,100,100,100))



