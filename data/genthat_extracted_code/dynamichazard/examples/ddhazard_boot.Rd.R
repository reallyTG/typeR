library(dynamichazard)


### Name: ddhazard_boot
### Title: Bootstrap for ddhazard Object
### Aliases: ddhazard_boot

### ** Examples

## Not run: 
##D library(dynamichazard)
##D set.seed(56219373)
##D fit <- ddhazard(
##D  Surv(time, status == 2) ~ log(bili), pbc, id = pbc$id, max_T = 3000,
##D  Q_0 = diag(1, 2), Q = diag(1e-4, 2), by = 100,
##D  control = ddhazard_control(method = "GMA"))
##D bt <- ddhazard_boot(fit, R = 999)
##D plot(fit, ddhazard_boot = bt, level = .9)
## End(Not run)





