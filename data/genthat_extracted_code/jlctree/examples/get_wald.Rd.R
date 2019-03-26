library(jlctree)


### Name: get_wald
### Title: Computes the Wald test statistic.
### Aliases: get_wald

### ** Examples

 data(data_timevar);
 f <- Surv(time_L, time_Y, delta)~y+X3+X4+X5;
 get_wald(f, data_timevar);




