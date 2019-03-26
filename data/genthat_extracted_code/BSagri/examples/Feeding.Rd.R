library(BSagri)


### Name: Feeding
### Title: Pupation and Hatching rate in a feeding experiment with four
###   varieties
### Aliases: Feeding
### Keywords: datasets

### ** Examples

data(Feeding)

# Larval mortality:

Feeding$Lmort <- Feeding$Total - Feeding$Pupating

fit1<-glm(cbind(Pupating,Lmort)~Variety,data=Feeding, family=quasibinomial)
anova(fit1, test="F")





