library(flexsurvcure)


### Name: flexsurvcure
### Title: Mixture and Non-Mixture Parametric Cure Models
### Aliases: flexsurvcure

### ** Examples

flexsurvcure(Surv(rectime,censrec)~group, data=bc, dist="weibull", anc=list(scale=~group))
flexsurvcure(Surv(rectime,censrec)~group, data=bc, dist="lnorm", mixture = FALSE)
flexsurvcure(Surv(rectime,censrec)~group, data=bc, dist="weibull", link="loglog")



