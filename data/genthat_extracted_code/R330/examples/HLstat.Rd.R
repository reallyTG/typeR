library(R330)


### Name: HLstat
### Title: Performs a Hosmer-Lemeshow test
### Aliases: HLstat HLstat.glm HLstat.formula
### Keywords: htest

### ** Examples

data(drug.df)
drug.glm<-glm(DFREE ~ . - IVHX - ID + factor(IVHX), family = binomial,
           data = drug.df)
HLstat(drug.glm)



