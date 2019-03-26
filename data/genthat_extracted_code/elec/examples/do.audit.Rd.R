library(elec)


### Name: do.audit
### Title: do.audit
### Aliases: do.audit

### ** Examples

Z = make.cartoon(n=200)
truth = make.truth.opt.bad(Z, t=0, bound="WPM")
samp.info=CAST.calc.sample(Z, beta=0.75, stages=1, t=5 )
audit.names = CAST.sample( Z, samp.info )
do.audit( Z, truth, audit.names )




