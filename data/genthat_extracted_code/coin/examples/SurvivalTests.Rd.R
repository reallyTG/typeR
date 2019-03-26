library(coin)


### Name: SurvivalTests
### Title: Two- and K-Sample Tests for Censored Data
### Aliases: surv_test logrank_test logrank_test.formula
###   logrank_test.IndependenceProblem
### Keywords: htest survival

### ** Examples

## Example data (Callaert, 2003, Tab.1)
callaert <- data.frame(
    time = c(1, 1, 5, 6, 6, 6, 6, 2, 2, 2, 3, 4, 4, 5, 5),
    group = factor(rep(0:1, c(7, 8)))
)

## Logrank scores using mid-ranks (Callaert, 2003, Tab.2)
with(callaert,
     logrank_trafo(Surv(time)))

## Asymptotic Mantel-Cox test (p = 0.0523)
survdiff(Surv(time) ~ group, data = callaert)

## Exact logrank test using mid-ranks (p = 0.0505)
logrank_test(Surv(time) ~ group, data = callaert, distribution = "exact")

## Exact logrank test using average-scores (p = 0.0468)
logrank_test(Surv(time) ~ group, data = callaert, distribution = "exact",
             ties.method = "average-scores")


## Lung cancer data (StatXact 9 manual, p. 213, Tab. 7.19)
lungcancer <- data.frame(
    time = c(257, 476, 355, 1779, 355,
             191, 563, 242, 285, 16, 16, 16, 257, 16),
    event = c(0, 0, 1, 1, 0,
              1, 1, 1, 1, 1, 1, 1, 1, 1),
    group = factor(rep(1:2, c(5, 9)),
                   labels = c("newdrug", "control"))
)

## Logrank scores using average-scores (StatXact 9 manual, p. 214)
with(lungcancer,
     logrank_trafo(Surv(time, event), ties.method = "average-scores"))

## Exact logrank test using average-scores (StatXact 9 manual, p. 215)
logrank_test(Surv(time, event) ~ group, data = lungcancer,
             distribution = "exact", ties.method = "average-scores")

## Exact Prentice test using average-scores (StatXact 9 manual, p. 222)
logrank_test(Surv(time, event) ~ group, data = lungcancer,
             distribution = "exact", ties.method = "average-scores",
             type = "Prentice")


## Approximative (Monte Carlo) versatile test (Lee, 1996)
rho.gamma <- expand.grid(rho = seq(0, 2, 1), gamma = seq(0, 2, 1))
lee_trafo <- function(y)
    logrank_trafo(y, ties.method = "average-scores",
                  type = "Fleming-Harrington",
                  rho = rho.gamma["rho"], gamma = rho.gamma["gamma"])

it <- independence_test(Surv(time, event) ~ group, data = lungcancer,
                        distribution = approximate(B = 10000),
                        ytrafo = function(data)
                            trafo(data, surv_trafo = lee_trafo))
pvalue(it, method = "step-down")



