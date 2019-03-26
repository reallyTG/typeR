library(sbpiper)


### Name: rightCI
### Title: Return the right value of the parameter confidence interval. The
###   provided dataset has two columns: ObjVal | ParamValue
### Aliases: rightCI

### ** Examples

data(insulin_receptor_all_fits)
colnames(insulin_receptor_all_fits)[1] <- "ObjVal"
min_objval <- min(insulin_receptor_all_fits[,1])
# compute the stats for parameter k2. 
insulin_receptor_all_fits <- subset(insulin_receptor_all_fits, select=c(1,3))
rightCI(largest.param.value=0.477115, 
        full_dataset=insulin_receptor_all_fits, 
        cl_objval=min_objval+0.01)
rightCI(largest.param.value=0.467000, 
        full_dataset=insulin_receptor_all_fits, 
        cl_objval=min_objval+0.01)



