library(R330)


### Name: cancer.df
### Title: Death Rates for Child Cancer
### Aliases: cancer.df
### Keywords: datasets

### ** Examples

data(cancer.df)
cancer.glm<-glm(n ~ Cytology*Residence*Age, family=poisson,
offset=log(pop/100000), data=cancer.df)
anova(cancer.glm, test="Chisq")



