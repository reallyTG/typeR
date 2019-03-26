library(dynamichazard)


### Name: predict.ddhazard
### Title: Predict Method for ddhazard Object
### Aliases: predict.ddhazard

### ** Examples

fit <- ddhazard(
 Surv(time, status == 2) ~ log(bili), pbc, id = pbc$id, max_T = 3600,
 Q_0 = diag(1, 2), Q = diag(1e-4, 2), by = 50,
 control = ddhazard_control(method = "GMA"))
predict(fit, type = "response", new_data =
 data.frame(time = 0, status = 2, bili = 3))
predict(fit, type = "term", new_data =
 data.frame(time = 0, status = 2, bili = 3))

# probability of an event between time 0 and 2000 with bili = 3
predict(fit, type = "response", new_data =
          data.frame(time = 0, status = 2, bili = 3, tstart = 0, tstop = 2000),
        tstart = "tstart", tstop = "tstop")




