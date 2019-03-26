library(robustbase)


### Name: foodstamp
### Title: Food Stamp Program Participation
### Aliases: foodstamp
### Keywords: datasets

### ** Examples

data(foodstamp)

(T123 <- xtabs(~ participation+ tenancy+ suppl.income, data=foodstamp))
summary(T123) ## ==> the binary var's are clearly not independent

foodSt <- within(foodstamp, {
   logInc <- log(1 + income)
   rm(income)
})

m1 <- glm(participation ~ ., family=binomial, data=foodSt)
summary(m1)
rm1 <- glmrob(participation ~ ., family=binomial, data=foodSt)
summary(rm1)
## Now use robust weights.on.x :
rm2 <- glmrob(participation ~ ., family=binomial, data=foodSt,
              weights.on.x = "robCov")
summary(rm2)## aha, now the weights are different:
which( weights(rm2, type="robust") < 0.5)



