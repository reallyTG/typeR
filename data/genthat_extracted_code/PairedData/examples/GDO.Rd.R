library(PairedData)


### Name: GDO
### Title: Agreement study
### Aliases: GDO
### Keywords: datasets

### ** Examples

data(GDO)

# Building new vectors for performing
# a repeated measures ANOVA
# with a fixed Day effect
Activation<-c(GDO[,2],GDO[,3],GDO[,4])
Subject<-factor(rep(GDO[,1],3))
Day<-factor(rep(c("D1","D2","D3"),rep(18,3)))
aovGDO<-aov(Activation~Day+Error(Subject))
summary(aovGDO)

# Reliability measurement: SEM and ICC(3,1)
sqrt(12426)
72704/(72704+12426)



