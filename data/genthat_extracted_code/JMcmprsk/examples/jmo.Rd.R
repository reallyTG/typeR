library(JMcmprsk)


### Name: jmo
### Title: Joint Modelling for Ordinal outcomes
### Aliases: jmo

### ** Examples

# A toy example on simulated data
 require(JMcmprsk)
 set.seed(123)
 yfile=system.file("extdata", "jmosimy.txt", package = "JMcmprsk")
 cfile=system.file("extdata", "jmosimc.txt", package = "JMcmprsk")
 mfile=system.file("extdata", "jmosimm.txt", package = "JMcmprsk")
 res3=jmo(p=3,s=1, yfile,cfile,mfile,point=10)
 coef(res3)
 anova(res3,coeff="beta")
 anova(res3,coeff="gamma")
 anova(res3,coeff="alpha")
#testing the function on real data with trace on
## Not run: 
##D require(JMcmprsk)
##D set.seed(123)
##D yfile=system.file("extdata", "ninds_nrank_y.txt", package = "JMcmprsk")
##D cfile=system.file("extdata", "ninds_nrank_c.txt", package = "JMcmprsk")
##D mfile=system.file("extdata", "ninds_nrank_m.txt", package = "JMcmprsk")
##D res=jmo(p=9,s=2, yfile,cfile,mfile,point=10,do.trace = TRUE)
##D coef(res)
##D anova(res,coeff="beta")
##D anova(res,coeff="gamma")
##D anova(res,coeff="alpha")
## End(Not run)



