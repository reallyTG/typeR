library(gte)


### Name: gte
### Title: Generalized Turnbull's Estimator
### Aliases: gte plot.gte print.gte

### ** Examples

data(simul)

## Calling Surv() with type="interval2"
Fit <- gte(Surv(L, R, type="interval2") ~ Z, data=simul, z=c(10, 20))
Fit

## Calling Surv() with type="interval"
event <- ifelse(is.na(simul$R), 0,
                ifelse(is.na(simul$L), 2,
                       ifelse(simul$R==simul$L, 1, 3)))
time <- ifelse(event==2, simul$R, simul$L)
time2 <- ifelse(event==3, simul$R, NA)
simul_event <- cbind(simul, time, time2, event)

Fit_event <- gte(Surv(time, time2, event, type="interval") ~ Z, data=simul_event, z=c(10, 20))
Fit_event

# The results are the same
all.equal(Fit_event$time, Fit$time)
all.equal(Fit_event$surv, Fit$surv)

## Plotting the results
plot(Fit, xleg="topright")



