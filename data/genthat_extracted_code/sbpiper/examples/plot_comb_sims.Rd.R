library(sbpiper)


### Name: plot_comb_sims
### Title: Plot the simulation time courses using a heatmap representation.
### Aliases: plot_comb_sims

### ** Examples

data(insulin_receptor_IR_beta_pY1146)
data(insulin_receptor_exp_dataset)
dir.create(file.path("sim_datasets_sum"))
write.table(insulin_receptor_IR_beta_pY1146, 
            file=file.path("sim_datasets_sum","insulin_receptor_IR_beta_pY1146.csv"), 
            row.names=FALSE)
write.table(insulin_receptor_exp_dataset, 
            file="insulin_receptor_exp_dataset.csv", 
            row.names=FALSE)
plot_comb_sims(inputdir="sim_datasets_sum", 
               outputdir="sim_plots",
               model="insulin_receptor",
               exp_dataset="insulin_receptor_exp_dataset.csv",
               plot_exp_dataset=TRUE, 
               exp_dataset_alpha=1.0, 
               xaxis_label="Time [m]", 
               yaxis_label="Level [a.u.]", 
               column_to_read='IR_beta_pY1146', 
               yaxis.min=NULL, 
               yaxis.max=NULL)



