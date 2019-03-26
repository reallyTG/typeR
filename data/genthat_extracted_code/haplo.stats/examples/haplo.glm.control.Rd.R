library(haplo.stats)


### Name: haplo.glm.control
### Title: Create list of control parameters for haplo.glm
### Aliases: haplo.glm.control
### Keywords: glm

### ** Examples

# NOT RUN
# using the data set up in the example for haplo.glm,
# the control function is used in haplo.glm as follows
#  > fit <- haplo.glm(y ~ male + geno, family = gaussian,  
#  >          na.action="na.geno.keep",
#  >          data=my.data, locus.label=locus.label,
#  >          control = haplo.glm.control(haplo.min.count=5,
#  >          em.c=haplo.em.control(n.try=1)))



