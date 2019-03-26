library(AER)


### Name: BankWages
### Title: Bank Wages
### Aliases: BankWages
### Keywords: datasets

### ** Examples

data("BankWages")

## exploratory analysis of job ~ education
## (tables and spine plots, some education levels merged)
xtabs(~ education + job, data = BankWages)
edcat <- factor(BankWages$education)
levels(edcat)[3:10] <- rep(c("14-15", "16-18", "19-21"), c(2, 3, 3))
tab <- xtabs(~ edcat + job, data = BankWages)
prop.table(tab, 1)
spineplot(tab, off = 0)
plot(job ~ edcat, data = BankWages, off = 0)

## fit multinomial model for male employees
library("nnet")
fm_mnl <- multinom(job ~ education + minority, data = BankWages,
  subset = gender == "male", trace = FALSE)
summary(fm_mnl)
confint(fm_mnl)

## same with mlogit package
if(require("mlogit")) {
fm_mlogit <- mlogit(job ~ 1 | education + minority, data = BankWages,
  subset = gender == "male", shape = "wide", reflevel = "custodial")
summary(fm_mlogit)
}



