library(jlctree)


### Name: get_node_val
### Title: Computes the test statistic at the current node.
### Aliases: get_node_val

### ** Examples

 data(data_timevar);
 f1 <- Surv(time_L, time_Y, delta)~X3+X4+X5;
 f2 <- Surv(time_L, time_Y, delta)~y+X3+X4+X5;
 get_node_val(f1, f2, data_timevar, lrt=TRUE);




