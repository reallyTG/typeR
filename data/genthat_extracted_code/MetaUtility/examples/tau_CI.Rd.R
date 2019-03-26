library(MetaUtility)


### Name: tau_CI
### Title: Return confidence interval for tau for a meta-analysis
### Aliases: tau_CI

### ** Examples

# calculate effect sizes for example dataset
d = metafor::escalc(measure="RR", ai=tpos, bi=tneg,
                   ci=cpos, di=cneg, data=metafor::dat.bcg)

# fit random-effects model
# note that metafor package returns on the log scale
m = metafor::rma.uni(yi= d$yi, vi=d$vi, knha=TRUE,
measure="RR", method="REML" )

tau_CI(m)

# for nicer formatting
format_CI( tau_CI(m)[1], tau_CI(m)[2] )



