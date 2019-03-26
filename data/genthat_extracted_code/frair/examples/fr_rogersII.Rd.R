library(frair)


### Name: fr_rogersII
### Title: Rogers' Type II Response
### Aliases: fr_rogersII rogersII rogersII_fit rogersII_nll

### ** Examples

data(gammarus)

pulex <- gammarus[gammarus$spp=='G.pulex',]
celt <- gammarus[gammarus$spp=='G.d.celticus',]

pulexfit <- frair_fit(eaten~density, data=pulex, 
                response='rogersII', start=list(a = 1.2, h = 0.015), 
                fixed=list(T=40/24))
celtfit <- frair_fit(eaten~density, data=celt, 
                response='rogersII', start=list(a = 1.2, h = 0.015), 
                fixed=list(T=40/24))

plot(c(0,30), c(0,30), type='n', xlab='Density', ylab='No. Eaten')
points(pulexfit)
points(celtfit, col=4)
lines(pulexfit)
lines(celtfit, col=4)

frair_compare(pulexfit, celtfit)

## Not run: 
##D pulexfit_b <- frair_boot(pulexfit)
##D celtfit_b <- frair_boot(celtfit)
##D confint(pulexfit_b)
##D confint(celtfit_b)
## End(Not run)



