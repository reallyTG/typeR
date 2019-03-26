library(MetaUtility)


### Name: prop_stronger
### Title: Estimate proportion of true effect sizes above or below a
###   threshold
### Aliases: prop_stronger

### ** Examples

# calculate effect sizes for example dataset
d = metafor::escalc(measure="RR", ai=tpos, bi=tneg,
                   ci=cpos, di=cneg, data=metafor::dat.bcg)

# fit random-effects model
# note that metafor package returns on the log scale
m = metafor::rma.uni(yi= d$yi, vi=d$vi, knha=TRUE,
measure="RR", method="REML" )

# pooled point estimate (RR scale)
exp(m$b)

# estimate the proportion of effects stronger than RR = 0.80
# no bootstrapping will be needed
prop_stronger( q = log(0.8),
               M = as.numeric(m$b),
               t2 = m$tau2,
               se.M = as.numeric(m$vb),
               se.t2 = m$se.tau2,
               CI.level = 0.95,
              tail = "below",
              bootstrap = "ifneeded")

## Not run: 
##D # now try a more extreme threshold, q, such that the function will use bootstrapping
##D # now we will need to pass the final 4 arguments as well
##D prop_stronger( q = log(0.9),
##D                M = as.numeric(m$b),
##D               t2 = m$tau2,
##D               se.M = as.numeric(m$vb),
##D               se.t2 = m$se.tau2,
##D               CI.level = 0.95,
##D               tail = "below",
##D 
##D               # below arguments control bootstrapping
##D               # only 100 iterates for demo purposes (should be higher in practice)
##D               dat = d,
##D               R = 100,
##D               bootstrap = "ifneeded",
##D               yi.name = "yi",
##D               vi.name = "vi" )
## End(Not run)



