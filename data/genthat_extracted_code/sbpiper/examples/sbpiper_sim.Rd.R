library(sbpiper)


### Name: sbpiper_sim
### Title: Main R function for SBpipe pipeline: simulate().
### Aliases: sbpiper_sim

### ** Examples

## No test: 
data(insulin_receptor_1)
data(insulin_receptor_2)
data(insulin_receptor_3)
data(insulin_receptor_exp_dataset)
dir.create(file.path("sim_datasets"))
dir.create(file.path("sim_datasets_sum"))
write.table(insulin_receptor_1, 
            file=file.path("sim_datasets", "insulin_receptor_1.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_2, 
            file=file.path("sim_datasets", "insulin_receptor_2.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_3, 
            file=file.path("sim_datasets", "insulin_receptor_3.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_exp_dataset, 
            file="insulin_receptor_exp_dataset.csv", 
            row.names=FALSE)
sbpiper_sim(model="insulin_receptor", 
           inputdir="sim_datasets", 
           outputdir="sim_plots", 
           outputfile_stats="insulin_receptor_IR_beta_pY1146_stats.csv", 
           outputfile_repeats=file.path("sim_datasets_sum", 
                                        "insulin_receptor_IR_beta_pY1146.csv"), 
           exp_dataset="insulin_receptor_exp_dataset.csv", 
           plot_exp_dataset=TRUE, 
           exp_dataset_alpha=1.0, 
           xaxis_label=NULL, 
           yaxis_label=NULL, 
           column_to_read="IR_beta_pY1146")
## End(No test)



