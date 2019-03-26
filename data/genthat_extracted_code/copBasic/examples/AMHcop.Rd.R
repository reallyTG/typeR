library(copBasic)


### Name: AMHcop
### Title: The Ali-Mikhail-Haq Copula
### Aliases: AMHcop
### Keywords: Ali--Mikhail--Haq copula copula (formulas) copula package
###   copula (comparison to)

### ** Examples

## Not run: 
##D t <- 0.9 # The Theta of the copula and we will compute Spearman Rho.
##D di <- integrate(function(t) log(t)/(1-t), lower=1, upper=(1-t))$value
##D A <- di*(1+t) - 2*log(1-t) + 2*t*log(1-t) - 3*t
##D rho <- 12*A/t^2 - 3    # 0.4070369
##D rhoCOP(AMHcop, para=t) # 0.4070369
##D sum(sapply(100:1,function(k) exp(log(3)+k*log(t)-2*lchoose(k+2,2))))
##D # 0.4070369 (see Note, very many tens of terms are needed) 
## End(Not run)

## Not run: 
##D layout(matrix(1:2,byrow=TRUE)) # Note Kendall's Tau same on reversal.
##D UVn <- simCOP(3560, cop=AMHcop, para=c(-0.9, "FALSE" ), col=4)
##D mtext("Normal definition [default]") # '2nd' parameter could be skipped
##D UVr <- simCOP(3560, cop=AMHcop, para=c(-0.9, "TRUE"),   col=2)
##D mtext("Reversed definition")
##D AMHcop(UVn[,1], UVn[,2])$tau # Should be about -0.1663313 because
##D AMHcop(UVr[,1], UVr[,2])$tau # tauCOP(AMHcop, para=-0.9) is theoretically. 
## End(Not run)



