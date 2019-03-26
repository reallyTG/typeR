library(jlctree)


### Name: get_lrt
### Title: Computes the likelihood ratio test statistic.
### Aliases: get_lrt

### ** Examples

 data(data_timevar);
 f1 <- Surv(time_L, time_Y, delta)~X3+X4+X5;
 f2 <- Surv(time_L, time_Y, delta)~y+X3+X4+X5;
 get_lrt(f1, f2, data_timevar);




