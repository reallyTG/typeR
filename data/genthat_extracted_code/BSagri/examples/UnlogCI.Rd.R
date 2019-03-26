library(BSagri)


### Name: UnlogCI
### Title: Transform confidence intervals from glm fits.
### Aliases: UnlogCI UnlogCI.glht
### Keywords: htest

### ** Examples


# # # CI for odds ratios
# # # for models on the logit-link

data(Feeding)

# Larval mortality:

Feeding$Lmort <- Feeding$Total - Feeding$Pupating

fit1<-glm(cbind(Pupating,Lmort)~Variety,data=Feeding, family=quasibinomial)
anova(fit1, test="F")

library(multcomp)

comp<-glht(fit1, mcp(Variety="Tukey"))

CIraw<-CIGLM(comp,method="Raw")

CIraw

UnlogCI(CIraw)

plotCI(UnlogCI(CIraw), lines=c(0.25,0.5,2,4),
 lineslwd=c(1,2,2,1), linescol=c("red","black","black","red"))


# # # # # # #

# # #  CI for ratios of means
# # # for models on the log-link

data(Diptera)

# Larval mortality:

fit2<-glm(Ges~Treatment, data=Diptera, family=quasipoisson)
anova(fit2, test="F")

library(multcomp)

comp<-glht(fit2, mcp(Treatment="Tukey"))

CIadj<-CIGLM(comp,method="Adj")

CIadj

UnlogCI(CIadj)

plotCI(UnlogCI(CIadj), lines=c(0.5,1,2), lineslwd=c(2,1,1))





