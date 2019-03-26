library(gmm)


### Name: ATEgel
### Title: ATE with Generalized Empirical Likelihood estimation
### Aliases: ATEgel checkConv

### ** Examples

data(nsw)
# Scale income
nsw$re78 <- nsw$re78/1000
nsw$re75 <- nsw$re75/1000
res <- ATEgel(re78~treat, ~age+ed+black+hisp+married+nodeg+re75,
data=nsw,type="ET")
summary(res)
chk <- checkConv(res)

res2 <- ATEgel(re78~treat, ~age+ed+black+hisp+married+nodeg+re75,
data=nsw,type="ET", momType="balSample")
summary(res2)
chk2 <- checkConv(res2)




