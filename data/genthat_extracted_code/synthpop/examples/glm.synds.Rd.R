library(synthpop)


### Name: glm.synds, lm.synds
### Title: Fitting (generalized) linear models to synthetic data
### Aliases: glm.synds lm.synds print.fit.synds
### Keywords: multivariate

### ** Examples

### Logit model 
ods <- SD2011[1:1000, c("sex", "age", "edu", "marital", "ls", "smoke")]
s1 <- syn(ods, m = 3)
f1 <- glm.synds(smoke ~ sex + age + edu + marital + ls, data = s1, family = "binomial")
f1
print(f1, msel = 1:2)
  
### Linear model
ods <- SD2011[1:1000,c("sex", "age", "income", "marital", "depress")]
ods$income[ods$income == -8] <- NA
s2 <- syn(ods, m = 3)
f2 <- lm.synds(depress ~ sex + age + log(income) + marital, data = s2)
f2
print(f2,1:3)



