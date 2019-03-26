library(sbpiper)


### Name: compute_sampled_ple_stats
### Title: Compute the table for the sampled PLE statistics.
### Aliases: compute_sampled_ple_stats

### ** Examples

data(insulin_receptor_all_fits)
colnames(insulin_receptor_all_fits)[1] <- "ObjVal"
min_objval <- min(insulin_receptor_all_fits[,1])
# compute the stats for parameter k2. 
insulin_receptor_all_fits <- subset(insulin_receptor_all_fits, select=c(1,3))
compute_sampled_ple_stats(df=insulin_receptor_all_fits, 
                          min_objval=min_objval, 
                          cl66_objval=min_objval+0.01, 
                          cl95_objval=min_objval+0.02, 
                          cl99_objval=min_objval+0.03, 
                          logspace=FALSE)



