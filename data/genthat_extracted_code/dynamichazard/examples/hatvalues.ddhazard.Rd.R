library(dynamichazard)


### Name: hatvalues.ddhazard
### Title: Hat Values for ddhazard Object
### Aliases: hatvalues.ddhazard

### ** Examples

library(dynamichazard)
fit <- ddhazard(
 Surv(time, status == 2) ~ log(bili), pbc, id = pbc$id, max_T = 3000,
 Q_0 = diag(1, 2), Q = diag(1e-4, 2), by = 100,
 control = ddhazard_control(method = "GMA"))
hvs <- hatvalues(fit)
head(hvs[[1]])
head(hvs[[2]])




