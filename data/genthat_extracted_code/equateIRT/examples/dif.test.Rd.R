library(equateIRT)


### Name: dif.test
### Title: DIF Test
### Aliases: dif.test print.dift

### ** Examples

# load the data
data(dataDIF)
head(dataDIF)
# estimate a 2PL model for each group using the R package ltm
library(ltm)
data1 <- dataDIF[dataDIF$group == 1, 1:20]
data2 <- dataDIF[dataDIF$group == 2, 1:20]
data3 <- dataDIF[dataDIF$group == 3, 1:20]
mod1 <- ltm(data1 ~ z1)
mod2 <- ltm(data2 ~ z1)
mod3 <- ltm(data3 ~ z1)
# extract the coefficients and the covariance matrix
est1 <- import.ltm(mod1, display = FALSE)
est2 <- import.ltm(mod2, display = FALSE)
est3 <- import.ltm(mod3, display = FALSE)

# perform the test for DIF on two groups
res_diftest2 <- dif.test(coef = list(est1$coef, est2$coef),
  var = list(est1$var, est2$var))
res_diftest2

# perform the test for DIF on three groups
res_diftest3 <- dif.test(coef = list(est1$coef, est2$coef, est3$coef),
  var = list(est1$var, est2$var, est3$var))
res_diftest3

# perform the test for DIF on three groups
# reference group: 2
# equating method: Haebara
# purification applied
res_diftest3 <- dif.test(coef = list(est1$coef, est2$coef, est3$coef),
  var = list(est1$var, est2$var, est3$var), reference = 2,
  method = "Haebara", purification = TRUE)
res_diftest3



