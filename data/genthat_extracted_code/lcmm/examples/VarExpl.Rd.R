library(lcmm)


### Name: VarExpl
### Title: Percentage of variance explained by the (latent class) linear
###   mixed model regression
### Aliases: VarExpl VarExpl.hlme VarExpl.lcmm VarExpl.Jointlcmm
###   VarExpl.multlcmm

### ** Examples


## Not run: 
##D m1 <- multlcmm(Ydep1+Ydep2~1+Time*X2+contrast(X2),random=~1+Time,
##D subject="ID",randomY=TRUE,link=c("4-manual-splines","3-manual-splines"),
##D intnodes=c(8,12,25),data=data_lcmm, 
##D B=c(-1.071, -0.192,  0.106, -0.005, -0.193,  1.012,  0.870,  0.881,
##D   0.000,  0.000, -7.520,  1.401,  1.607 , 1.908,  1.431,  1.082,
##D  -7.528,  1.135 , 1.454 , 2.328, 1.052))
##D 
##D # variation percentages explained by linear mixed regression
##D VarExpl(m1,data.frame(Time=0))
## End(Not run)




