library(spatialwarnings)


### Name: generic_sews
### Title: Generic Spatial Early-Warning signals
### Aliases: generic_sews indictest.generic_sews plot.generic_sews_test
###   plot.generic_sews

### ** Examples


data(serengeti)
gen_indic <- generic_sews(serengeti, subsize = 5, 
                           moranI_coarse_grain = TRUE)

# Display results
summary(gen_indic)

# Display trends along the varying model parameter
plot(gen_indic, along = serengeti.rain)

# Compute significance (long)
## Not run: 
##D gen_test <- indictest(gen_indic)
##D 
##D print(gen_test)
##D 
##D # Display the trend, now with a grey ribbon indicating the 5%-95% quantile
##D # range of the null distribution
##D plot(gen_test, along = serengeti.rain)
##D 
##D # Display the effect size compared to null distribution 
##D plot(gen_test, along = serengeti.rain, what = "z_score")
##D 
##D # Note that plot() method returns a ggplot object that can be modified
##D # for convenience
##D if ( require(ggplot2) ) { 
##D   plot(gen_test, along = serengeti.rain) + 
##D     geom_vline(xintercept = 593, color = "red", linetype = "dashed") +
##D     xlab('Annual rainfall') + 
##D     theme_minimal()
##D }
##D 
## End(Not run)




