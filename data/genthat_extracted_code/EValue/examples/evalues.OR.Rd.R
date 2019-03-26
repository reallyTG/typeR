library(EValue)


### Name: evalues.OR
### Title: Compute E-value for an odds ratio and its confidence interval
###   limits
### Aliases: evalues.OR

### ** Examples

# compute E-values for OR = 0.86 with CI: [0.75, 0.99]
# for a common outcome
evalues.OR( 0.86, 0.75, 0.99, rare = FALSE )

## Example 2
## Hsu and Small (2013 Biometrics) Data
## sensitivity analysis after log-linear or logistic regression

head(lead)

## log linear model -- obtain the conditional risk ratio
lead.loglinear = glm(lead ~ ., family = binomial(link = "log"), 
                         data = lead)
est = summary( lead.loglinear )$coef[2, c(1, 2)]

RR       = exp(est[1])
lowerRR  = exp(est[1] - 1.96*est[2])
upperRR  = exp(est[1] + 1.96*est[2]) 
evalues.RR(RR, lowerRR, upperRR)

## logistic regression -- obtain the conditional odds ratio
lead.logistic = glm(lead ~ ., family = binomial(link = "logit"), 
                        data = lead)
est = summary( lead.logistic )$coef[2, c(1, 2)]

OR       = exp(est[1])
lowerOR  = exp(est[1] - 1.96*est[2])
upperOR  = exp(est[1] + 1.96*est[2]) 
evalues.OR(OR, lowerOR, upperOR, rare=FALSE)



