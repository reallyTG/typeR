library(asbio)


### Name: pairw.anova
### Title: Conducts pairwise post hoc and planned comparisons associated
###   with an ANOVA
### Aliases: pairw.anova lsdCI bonfCI tukeyCI scheffeCI dunnettCI
###   scheffe.cont bonf.cont print.pairw
### Keywords: univar htest

### ** Examples

eggs<-c(11,17,16,14,15,12,10,15,19,11,23,20,18,17,27,33,22,26,28)
trt<-as.factor(c(1,1,1,1,1,2,2,2,2,2,3,3,3,3,4,4,4,4,4))

pairw.anova(y = eggs, x = trt, method = "lsd")##LSD method
pairw.anova(y = eggs, x = trt, method = "bonf")##Bonferroni
pairw.anova(y = eggs, x = trt, method = "scheffe")##Sheffe
tukey <- pairw.anova(y = eggs, x = trt, method = "tukey")##Tukey HSD

plot(tukey)
#you can also try plot(tukey, type = 2)

blood.count <- data.frame(bc=c(7.4,8.5,7.2,8.24,9.84,8.32,9.76,8.8,
7.68,9.36,12.8,9.68,12.16,9.2,10.55), trt=c(rep("C",6),rep("A",4),rep("B",5)))
with(blood.count,pairw.anova(y=bc,x=trt,control="C",method="dunnett"))##Dunnett

scheffe.cont(y = eggs, x = trt, lvl = c(1, 3)) 
scheffe.cont(y = eggs, x = trt, lvl = c(1,2))

bonf.cont(y = eggs, x = trt, lvl = c(1,3), comps = 2) 
bonf.cont(y = eggs, x=trt, lvl = c(1,2), comps = 2) 



