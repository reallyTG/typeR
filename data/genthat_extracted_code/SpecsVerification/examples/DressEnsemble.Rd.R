library(SpecsVerification)


### Name: DressEnsemble
### Title: Transform an ensemble forecast to a continuous forecast
###   distribution by kernel dressing.
### Aliases: DressEnsemble

### ** Examples

data(eurotempforecast)
d.silverman <- DressEnsemble(ens)
d.akd <- DressEnsemble(ens, dressing.method="akd", 
                       parameters=list(r1=0, r2=0, a=1, 
                                       s1=0, s2=0))
d.akd.fit <- DressEnsemble(ens, dressing.method="akd.fit", 
                           parameters=list(obs=obs))



