library(synthpop)


### Name: multinom.synds
### Title: Fitting multinomial models to synthetic data
### Aliases: multinom.synds
### Keywords: multivariate

### ** Examples

ods <- SD2011[1:1000, c("sex", "age", "edu", "marital", "ls", "smoke")]
s1 <- syn(ods, m = 3)
f1 <- multinom.synds(edu  ~ sex + age, data = s1)
summary(f1)
print(summary(f1, msel = 1:2))
compare(f1,ods)



