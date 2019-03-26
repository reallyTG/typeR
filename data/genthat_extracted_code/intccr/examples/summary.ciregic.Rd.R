library(intccr)


### Name: summary.ciregic
### Title: Summary of 'ciregic'
### Aliases: summary.ciregic

### ** Examples

## Continuing the ciregic(...) example
## Don't show: 
newdata <- dataprep(data = longdata, ID = "id", time = "t",
                    event = "c", Z = c("z1", "z2"))
fit <- ciregic(formula = Surv2(v, u, c) ~ z1 + z2, data = newdata,
               alpha = c(1, 1), nboot = 0, do.par = FALSE)
## End(Don't show)
sfit <- summary(fit)
sfit




