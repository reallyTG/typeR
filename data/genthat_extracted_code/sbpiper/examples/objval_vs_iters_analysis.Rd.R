library(sbpiper)


### Name: objval_vs_iters_analysis
### Title: Analysis of the Objective values vs Iterations.
### Aliases: objval_vs_iters_analysis

### ** Examples

dir.create(file.path("pe_datasets"))
dir.create(file.path("pe_plots"))
data(insulin_receptor_all_fits)
colnames(insulin_receptor_all_fits)[1] <- "ObjVal"
write.table(insulin_receptor_all_fits, 
            file=file.path("pe_datasets", "all_fits.csv"), 
            row.names=FALSE)
objval_vs_iters_analysis(model="model", 
                         filename=file.path("pe_datasets", "all_fits.csv"), 
                         plots_dir="pe_plots")



