library(forestmangr)


### Name: resid_plot
### Title: Calculate residual values and create plots
### Aliases: resid_plot

### ** Examples

library(forestmangr)
data("exfm11")
exfm11

# Specifying the observed and estimated variables, we get a scatter plot
# for the percentage residuals:
resid_plot(exfm11, "TH", "TH_EST1")

# It's possible to get other types of plots, with the type argument:
resid_plot(exfm11, "TH", "TH_EST1", type = "histogram_curve")
resid_plot(exfm11, "TH", "TH_EST1", type = "versus")

# It's possible to add a factor variable as color in the plots:
resid_plot(exfm11, "TH", "TH_EST1", "TH_EST2", color="STRATA", 
xlab="Total Height (m)", clab="Strata", gray_scale=FALSE)

# If there are more estimated values variables, they can also be used
# in the comparison:
resid_plot(exfm11, "TH", "TH_EST1", "TH_EST2", "TH_EST3")

# It's possible to rearrange the plots with ncol and nrow:
resid_plot(exfm11, "TH", "TH_EST1", "TH_EST2", "TH_EST3", ncol=1)

# It's possible to get the residuals table used to generate these plots, with res_table=TRUE:
head( resid_plot(exfm11, "TH", "TH_EST1", "TH_EST2", res_table = TRUE) )




