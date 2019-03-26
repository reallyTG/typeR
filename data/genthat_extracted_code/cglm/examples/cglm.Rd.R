library(cglm)


### Name: cglm
### Title: Estimates the ratio of the regression coefficients and the
###   dispersion parameter in conditional generalized linear models for
###   clustered data.
### Aliases: cglm

### ** Examples


data(teenpov)

fit.ide <- cglm(method="ts", formula=hours~nonpov+inschool+spouse+age+mother, 
  data=teenpov, id="ID", link="identity")
summary(fit.ide)

fit.log <- cglm(method="ts", formula=hours~nonpov+inschool+spouse+age+mother, 
  data=teenpov, id="ID", link="log")
summary(fit.log)

fit.cglm <- cglm(method="cml", formula=hours~nonpov+inschool+spouse+age+mother,
  data=teenpov, id="ID")
summary(fit.cglm)




