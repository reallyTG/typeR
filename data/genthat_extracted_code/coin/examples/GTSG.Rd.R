library(coin)


### Name: GTSG
### Title: Gastrointestinal Tumor Study Group
### Aliases: GTSG
### Keywords: datasets

### ** Examples

## Plot Kaplan-Meier estimates
plot(survfit(Surv(time / (365.25 / 12), event) ~ group, data = GTSG),
     lty = 1:2, ylab = "% Survival", xlab = "Survival Time in Months")
legend("topright", lty = 1:2,
       c("Chemotherapy+Radiation", "Chemotherapy"), bty = "n")

## Asymptotic logrank test
logrank_test(Surv(time, event) ~ group, data = GTSG)

## Asymptotic Prentice test
logrank_test(Surv(time, event) ~ group, data = GTSG, type = "Prentice")

## Asymptotic test against Weibull-type alternatives (Moreau et al., 1992)
moreau_weight <- function(time, n.risk, n.event)
    1 + log(-log(cumprod(n.risk / (n.risk + n.event))))

independence_test(Surv(time, event) ~ group, data = GTSG,
                  ytrafo = function(data)
                      trafo(data, surv_trafo = function(y)
                          logrank_trafo(y, weight = moreau_weight)))

## Asymptotic test against crossing-curve alternatives (Shen and Le, 2000)
shen_trafo <- function(x)
    ansari_trafo(logrank_trafo(x, type = "Prentice"))

independence_test(Surv(time, event) ~ group, data = GTSG,
                  ytrafo = function(data)
                      trafo(data, surv_trafo = shen_trafo))



