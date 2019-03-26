library(sbpiper)


### Name: plot_combined_tc
### Title: Plot repeated time courses in the same plot with mean, 1
###   standard deviation, and 95% confidence intervals.
### Aliases: plot_combined_tc

### ** Examples

data(insulin_receptor_1)
data(insulin_receptor_2)
data(insulin_receptor_3)
df <- data.frame(Time=insulin_receptor_1[,1], 
                 X1=insulin_receptor_1[,2], 
                 X2=insulin_receptor_2[,2], 
                 X3=insulin_receptor_3[,2])
plot_combined_tc(df=df, 
                 xaxis_label="Time [m]", yaxis_label="Level [a.u.]", 
                 bar_type="mean", alpha=1, yaxis.min=NULL, yaxis.max=NULL)
plot_combined_tc(df=df, 
                 xaxis_label="Time [m]", yaxis_label="Level [a.u.]", 
                 bar_type="mean_sd", alpha=1, yaxis.min=NULL, yaxis.max=NULL)
plot_combined_tc(df=df, 
                 xaxis_label="Time [m]", yaxis_label="Level [a.u.]", 
                 bar_type="mean_sd_ci95", alpha=0.3, yaxis.min=NULL, yaxis.max=NULL)



