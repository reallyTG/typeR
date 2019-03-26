library(aftgee)


### Name: aftsrr
### Title: Accelerated Failure Time with Smooth Rank Regression
### Aliases: aftsrr

### ** Examples

## kidney data
library(survival)
data(kidney)
foo <- aftsrr(Surv(time, status) ~ age + sex, id = id,
                data = kidney, se = c("ISMB", "ZLMB"), B = 10)
foo

## nwtco data
library(survival)
data(nwtco)
subinx <- sample(1:nrow(nwtco), 668, replace = FALSE)
nwtco$subcohort <- 0
nwtco$subcohort[subinx] <- 1
pn <- table(nwtco$subcohort)[[2]] / sum(table(nwtco$subcohort))
nwtco$hi <- nwtco$rel + ( 1 - nwtco$rel) * nwtco$subcohort / pn
nwtco$age12 <- nwtco$age / 12
nwtco$study <- nwtco$study - 3
nwtco$histol = nwtco$histol - 1
sub <- nwtco[subinx,]
fit <- aftsrr(Surv(edrel, rel) ~ histol + age12 + study, id = seqno,
       weights = hi, data = sub, B = 10, se = c("ISMB", "ZLMB"),
       subset = stage == 4)
summary(fit)



