library(ltmle)


### Name: summary.ltmle
### Title: Get standard error, p-value, and confidence interval for one
###   ltmle object Summarizing results from Longitudinal Targeted Maximum
###   Likelihood Estimation (ltmle)
### Aliases: summary.ltmle print.ltmle print.summary.ltmle summary.ltmleMSM
###   print.ltmleMSM print.summary.ltmleMSM summary.ltmleEffectMeasures
###   print.ltmleEffectMeasures print.summary.ltmleEffectMeasures

### ** Examples


rexpit <- function(x) rbinom(n = length(x), size = 1, prob = plogis(x))

# Compare the expected outcomes under two counterfactual plans: Treatment plan:
# set A1 to 1 if W > 0, set A2 to 1 if W > 1.5, always set A3 to 1 Control plan:
# always set A1, A2, and A3 to 0
W <- rnorm(1000)
A1 <- rexpit(W)
A2 <- rexpit(W + 2 * A1)
A3 <- rexpit(2 * A1 - A2)
Y <- rexpit(W - A1 + 0.5 * A2 + 2 * A3)
data <- data.frame(W, A1, A2, A3, Y)
treatment <- cbind(W > 0, W > 1.5, 1)
control <- matrix(0, nrow = 1000, ncol = 3)
result <- ltmle(data, Anodes = c("A1", "A2", "A3"), Ynodes = "Y", abar = list(treatment, 
    control))
print(summary(result))

## For examples of summary.ltmle and summary.ltmleMSM, see example(ltmle)




