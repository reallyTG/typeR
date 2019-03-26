library(BaylorEdPsych)


### Name: PseudoR2
### Title: Pseudo-R2 Statistics
### Aliases: PseudoR2
### Keywords: R2 Pseudo-R2 Logistic Regression

### ** Examples

data(MLBOffense2011)
MLBOffense2011$NL<-ifelse(MLBOffense2011$Lg=="NL", 1,0)
#predict MLB league membership from RBI and slugging
model1<-glm(NL~RBI + SLG, data=MLBOffense2011, family=binomial(link="logit"))  
PseudoR2(model1)



