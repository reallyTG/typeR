library(sbpiper)


### Name: plot_raw_dataset
### Title: Add experimental data points to a plot. The length of the
###   experimental time course to plot is limited by the length of the
###   simulated time course (=max_sim_tp).
### Aliases: plot_raw_dataset

### ** Examples

data(insulin_receptor_exp_dataset)
plot_raw_dataset(insulin_receptor_exp_dataset, readout="IR_beta_pY1146", 
                 max_sim_tp=30, alpha=1, yaxis.min=NULL, yaxis.max=NULL) 



