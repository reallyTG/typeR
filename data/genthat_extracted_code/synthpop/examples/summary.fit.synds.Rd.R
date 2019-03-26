library(synthpop)


### Name: summary.fit.synds
### Title: Inference from synthetic data
### Aliases: summary.fit.synds print.summary.fit.synds

### ** Examples

ods <- SD2011[1:1000,c("sex","age","edu","ls","smoke")]
  
### simple synthesis
s1 <- syn(ods, m = 5)
f1 <- glm.synds(smoke ~ sex + age + edu + ls, data = s1, family = "binomial")
summary(f1)
summary(f1, population.inference = TRUE)
  
### proper synthesis
s2 <- syn(ods, m = 5, method = "parametric", proper = TRUE)
f2 <- glm.synds(smoke ~ sex + age + edu + ls, data = s2, family = "binomial")
summary(f2)
summary(f2, population.inference = TRUE)



