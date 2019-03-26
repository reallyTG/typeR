library(dynamichazard)


### Name: ddhazard
### Title: Fitting Dynamic Hazard Models
### Aliases: ddhazard

### ** Examples

# example with first order model
library(dynamichazard)
fit <- ddhazard(
 Surv(time, status == 2) ~ log(bili), pbc, id = pbc$id, max_T = 3600,
 Q_0 = diag(1, 2), Q = diag(1e-4, 2), by = 50,
 control = ddhazard_control(method = "GMA"))
plot(fit)

# example with second order model
fit <- ddhazard(
 Surv(time, status == 2) ~ log(bili), pbc, id = pbc$id, max_T = 3600,
 Q_0 = diag(1, 4), Q = diag(1e-4, 2), by = 50,
 control = ddhazard_control(method = "GMA"),
 order = 2)
plot(fit)




