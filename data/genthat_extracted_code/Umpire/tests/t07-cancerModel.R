library(Umpire)
# set seed to ensure reproducibility
set.seed(539586)
# create a cancer model
x <- CancerModel('test', 30, 10,
                 HIT  = function(n) 3+rbinom(1, 4, 0.7),
                 SURV = function(n) rnorm(n, 0, 2),
                 OUT  = function(n) rnorm(n, 0, 2))
# describe the model
print(paste('Number of patterns:', nPatterns(x), '(should equal 10)'))
print(paste('Number of hits:', nPossibleHits(x), '(should equal 30)'))
print(nHitsPerPattern(x))
summary(x)
# check correlation
cor(survivalCoefficients(x), outcomeCoefficients(x))
plot(survivalCoefficients(x), outcomeCoefficients(x))
# generate outcome data from the model
y <- rand(x, 300)
print(table(y$Outcome, y$CancerSubType))
if (require(survival)) {
  plot(survfit(Surv(LFU, Event) ~ Outcome, y))
  z <- coxph(Surv(LFU, Event) ~ Outcome, y)
  summary(z)
}
# cleanup
rm(x, y, z)



