library(SIMMS)


### Name: get.chisq.stats
### Title: Applies survdiff function
### Aliases: get.chisq.stats
### Keywords: survival

### ** Examples

survtime <- sample(seq(0.1,10,0.1), 100, replace = TRUE);
survstat <- sample(c(0,1), 100, replace = TRUE);
survobj <- Surv(survtime, survstat);
groups <- sample(c('A','B'), 100, replace = TRUE);
get.chisq.stats(
  groups = as.factor(groups),
  survobj = survobj
  );



