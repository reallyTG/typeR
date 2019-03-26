library(dynamichazard)


### Name: plot.ddhazard
### Title: Plots for ddhazard Object
### Aliases: plot.ddhazard

### ** Examples

library(dynamichazard)
fit <- ddhazard(
 Surv(time, status == 2) ~ log(bili), pbc, id = pbc$id, max_T = 3600,
 Q_0 = diag(1, 2), Q = diag(1e-4, 2), by = 50,
 control = ddhazard_control(method = "GMA"))
plot(fit)
plot(fit, cov_index = 2)




