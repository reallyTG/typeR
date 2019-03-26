library(plsr)


### Name: plot_latent_variables
### Title: Plots latent variables
### Aliases: plot_latent_variables

### ** Examples

plsr_obj = pls(rating_data, tracking_data,10,10)

#plot latent variable effect with barplots (default) for X and Y side
plot_latent_variables(plsr_obj)
## No test: 
#plot latent variables with barplots for the X side and
#a custom plot function tailored to face tracking data for the Y side
plot_latent_variables(plsr_obj,lv=1:2, sd=2, FUN=c(barplot,plsr:::plot_frame))

#same as above but with additional arguments passed to the plotting functions
plot_latent_variables(plsr_obj,FUN = c(barplot,plsr:::plot_frame),
    args1=list(col="red"),args2 = list(single_frame=5))
## End(No test)




