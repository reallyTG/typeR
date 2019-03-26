library(sbpiper)


### Name: leftCI
### Title: Return the left value of the parameter confidence interval. The
###   provided dataset has two columns: ObjVal | ParamValue
### Aliases: leftCI

### ** Examples

data(insulin_receptor_all_fits)
colnames(insulin_receptor_all_fits)[1] <- "ObjVal"
min_objval <- min(insulin_receptor_all_fits[,1])
# compute the stats for parameter k2. 
insulin_receptor_all_fits <- subset(insulin_receptor_all_fits, select=c(1,3))
leftCI(smallest.param.value=0.466971, 
        full_dataset=insulin_receptor_all_fits, 
        cl_objval=min_objval+0.01)
leftCI(smallest.param.value=0.467000, 
        full_dataset=insulin_receptor_all_fits, 
        cl_objval=min_objval+0.01)



