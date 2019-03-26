library(mnreadR)


### Name: nlmeCurve
### Title: Plot individual MNREAD fitted curves as estimated by a nonlinear
###   mixed-effect (NLME) modeling.
### Aliases: nlmeCurve

### ** Examples

# inspect the structure of the dataframe
head(data_low_vision, 10)

#------

# restrict dataset to one MNREAD test per subject (regular polarity only)
data_regular <- data_low_vision %>%
    filter (polarity == "regular")

# run the NLME model for data grouped by subject
## Not run:  nlme_model <- nlmeModel(data_regular, ps, vd, rt, err, subject) 

#------

# plot MNREAD curves and CPS with a default CPS criterion of '90 of MRS' 
## Not run:  nlmeCurve(nlme_model) 

# plot MNREAD curves without the CPS for a default CPS criterion of '90 of MRS' 
## Not run:  nlmeCurve(nlme_model, FALSE) 

# plot MNREAD curves and CPS with a specific CPS criterion of '80 of MRS'
## Not run:  nlmeCurve(nlme_model, TRUE, 0.8) 


#------

# Once created, the NLME curve can be further customized using ggplot2 

# plot the NLME curve 
## Not run:  my_plot <- nlmeCurve(nlme_model) 

# display my.plot
## Not run:  print(my_plot) 

# modify my.plot
## Not run: 
##D  my_new_plot <- my_plot + 
##D  # overwrites the raw data points
##D     geom_point(data = nlme_model[[1]], aes(x=correct_ps, y = rs), size = 4) + 
##D  # changes the colors of the curve and raw data (effective only for nested designs)
##D     scale_color_brewer(palette="Set1") + 
##D  # changes the colors of the CPS diamond (effective only for nested designs)
##D     scale_fill_brewer(palette="Set1")  + 
##D  # modifies the aspect of the x-axis
##D     scale_x_continuous(breaks = seq (-0.5,2.5,0.4))  
## End(Not run)

# display my.new.plot                                                                        
## Not run:  print(my_new_plot) 


#------

# For very large datasets, it can be usefull to plot only selected facets to inspect individual fit
# To do so, one needs to restrict the dataframe called in each of the three layers of the plot

# list of subject names to keep
subjects_to_keep <- paste ("s", 1:4, sep = "")

# first filter the original data points (data called in the first layer)
## Not run: 
##D  my_plot$data <- my_plot$data %>%
##D     filter(subject %in% subjects_to_keep) %>%
##D     droplevels() 
## End(Not run)
    
# then filter the fitted data points (data called in the second layer)
## Not run: 
##D  my_plot$layers[[2]]$data <- my_plot$layers[[2]]$data %>% 
##D     filter(subject %in% subjects_to_keep) %>% 
##D     droplevels() 
## End(Not run)
  
# and finally, if 'displayCPS' was set to TRUE, filter the data used to display the CPS
## Not run: 
##D  my_plot$layers[[4]]$data <- my_plot$layers[[4]]$data %>% 
##D     filter(subject %in% subjects_to_keep) %>%
##D     droplevels() 
## End(Not run)
    
# plot the restricted my.plot
## Not run:  my_plot 






