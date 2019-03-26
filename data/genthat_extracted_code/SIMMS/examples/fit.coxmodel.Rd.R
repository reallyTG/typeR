library(SIMMS)


### Name: fit.coxmodel
### Title: Fit a Cox proportional hazards model
### Aliases: fit.coxmodel
### Keywords: survival

### ** Examples

survtime <- sample(seq(0.1,10,0.1), 100, replace = TRUE);
survstat <- sample(c(0,1), 100, replace = TRUE);
survobj <- Surv(survtime, survstat);
groups <- sample(c('A','B'), 100, replace = TRUE);
fit.coxmodel(
  groups = as.factor(groups),
  survobj = survobj
  );



