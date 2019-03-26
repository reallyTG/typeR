library(synthpop)


### Name: compare.fit.synds
### Title: Compare model estimates based on synthesised and observed data
### Aliases: compare.fit.synds print.compare.fit.synds

### ** Examples

ods <- SD2011[,c("sex","age","edu","smoke")]
s1 <- syn(ods, m = 3)
f1 <- glm.synds(smoke ~ sex + age + edu, data = s1, family = "binomial")
compare(f1, ods) 
compare(f1, ods, print.coef = TRUE, plot = "coef")



