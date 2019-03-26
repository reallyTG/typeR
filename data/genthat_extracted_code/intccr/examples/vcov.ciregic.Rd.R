library(intccr)


### Name: vcov.ciregic
### Title: Variance-covariance matrix of 'ciregic'
### Aliases: vcov.ciregic

### ** Examples

## Continuing the ciregic(...) example
## Don't show: 
newdata <- dataprep(data = longdata, ID = "id", time = "t",
                    event = "c", Z = c("z1", "z2"))
fit <- ciregic(formula = Surv2(v, u, c) ~ z1 + z2, data = newdata,
               alpha = c(1, 1), nboot = 0, do.par = FALSE)
## End(Don't show)
vcov(fit)





