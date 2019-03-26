library(metamisc)


### Name: DVTipd
### Title: Hypothetical dataset for diagnosis of Deep Vein Thrombosis (DVT)
### Aliases: DVTipd
### Keywords: datasets

### ** Examples

data(DVTipd)
str(DVTipd) 
summary(apply(DVTipd,2,as.factor))

## Develop a prediction model to predict presence of DVT
model.dvt <- glm("dvt~sex+oachst+malign+surg+notraum+vein+calfdif3+ddimdich", 
                  family=binomial, data=DVTipd)
summary(model.dvt)



