library(ReIns)


### Name: KaplanMeier
### Title: Kaplan-Meier estimator
### Aliases: KaplanMeier

### ** Examples

data <- c(1, 2.5, 3, 4, 5.5, 6, 7.5, 8.25, 9, 10.5)
censored <- c(0, 1, 0, 0, 1, 0, 1, 1, 0, 1)

x <- seq(0, 12, 0.1)

# Kaplan-Meier estimator
plot(x, KaplanMeier(x, data, censored)$surv, type="s", ylab="Kaplan-Meier estimator")



