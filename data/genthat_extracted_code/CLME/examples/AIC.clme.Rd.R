library(CLME)


### Name: AIC.clme
### Title: Akaike information criterion
### Aliases: AIC.clme AIC.summary.clme

### ** Examples


data( rat.blood )

cons <- list(order = "simple", decreasing = FALSE, node = 1 )
clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
                 constraints = cons, seed = 42, nsim = 0)

AIC( clme.out )
AIC( clme.out, k=log( nobs(clme.out)/(2*pi) ) )





