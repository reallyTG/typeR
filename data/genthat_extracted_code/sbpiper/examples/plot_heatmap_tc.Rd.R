library(sbpiper)


### Name: plot_heatmap_tc
### Title: Plot time courses organised as data frame columns with a
###   heatmap.
### Aliases: plot_heatmap_tc

### ** Examples

data(insulin_receptor_1)
data(insulin_receptor_2)
data(insulin_receptor_3)
df <- data.frame(Time=insulin_receptor_1[,1], 
                 X1=insulin_receptor_1[,2], 
                 X2=insulin_receptor_2[,2], 
                 X3=insulin_receptor_3[,2])
plot_heatmap_tc(df=df, scaled=FALSE, xaxis_label="Time [m]", yaxis_label="repeats")
plot_heatmap_tc(df=df, scaled=TRUE, xaxis_label="Time [m]", yaxis_label="repeats")



