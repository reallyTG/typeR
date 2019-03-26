library(metafor)


### Name: hc
### Title: Meta-Analysis based on the Method by Henmi and Copas (2010)
### Aliases: hc hc.rma.uni
### Keywords: htest

### ** Examples

### meta-analysis based on log odds ratios
res <- rma(measure="OR", ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat.lee2004)
res

### funnel plot as in Henmi and Copas (2010)
funnel(res, yaxis="seinv", refline=0, xlim=c(-3,3), ylim=c(.5,3.5), steps=7, digits=1)

### use method by Henmi and Copas (2010) as a sensitivity analysis
hc(res)

### back-transform results to odds ratio scale
hc(res, transf=exp)



