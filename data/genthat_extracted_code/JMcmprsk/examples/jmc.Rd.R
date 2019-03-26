library(JMcmprsk)


### Name: jmc
### Title: Joint Modelling for Continuous outcomes
### Aliases: jmc

### ** Examples

# A toy example on simulated data
require(JMcmprsk)
set.seed(123)
yfile=system.file("extdata", "jmcsimy.txt", package = "JMcmprsk")
cfile=system.file("extdata", "jmcsimc.txt", package = "JMcmprsk")
mfile=system.file("extdata", "jmcsimm.txt", package = "JMcmprsk")
res2=jmc(p=4,yfile,cfile,mfile,point=6)
coef(res2)
anova(res2,coeff="beta")
anova(res2,coeff="gamma")
#testing the function on real data with trace on
## Not run: 
##D require(JMcmprsk)
##D set.seed(123)
##D yfile=system.file("extdata", "fvc621_y.txt", package = "JMcmprsk")
##D cfile=system.file("extdata", "fvc621_c.txt", package = "JMcmprsk")
##D mfile=system.file("extdata", "fvc621_m.txt", package = "JMcmprsk")
##D res1=jmc(p=8,yfile,cfile,mfile,do.trace = TRUE)
##D coef(res1) 
##D anova(res1,coeff="beta") 
##D anova(res1,coeff="gamma")   
## End(Not run) 



