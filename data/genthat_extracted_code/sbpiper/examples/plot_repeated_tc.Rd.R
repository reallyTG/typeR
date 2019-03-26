library(sbpiper)


### Name: plot_repeated_tc
### Title: Plot repeated time courses in the same plot separately. First
###   column is Time.
### Aliases: plot_repeated_tc

### ** Examples

data(insulin_receptor_1)
data(insulin_receptor_2)
data(insulin_receptor_3)
df <- data.frame(Time=insulin_receptor_1[,1], 
                 X1=insulin_receptor_1[,2], 
                 X2=insulin_receptor_2[,2], 
                 X3=insulin_receptor_3[,2])
plot_repeated_tc(df=df, 
                 xaxis_label="Time [m]", yaxis_label="Level [a.u.]", 
                 alpha=1, yaxis.min=NULL, yaxis.max=NULL)



