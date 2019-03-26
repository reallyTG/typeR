library(emdi)


### Name: map_plot
### Title: Visualizes regional disaggregrated estimates on a map
### Aliases: map_plot

### ** Examples

## Not run: 
##D data("eusilcA_pop")
##D data("eusilcA_smp")
##D 
##D # Generate emdi object with additional indicators; here via function ebp()
##D emdi_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash + 
##D                     self_empl + unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + 
##D                     fam_allow + house_allow + cap_inv + tax_adj, pop_data = eusilcA_pop,
##D                   pop_domains = "district", smp_data = eusilcA_smp, smp_domains = "district",
##D                   threshold = 11064.82, transformation = "box.cox", L= 50, MSE = TRUE, B = 50)
##D 
##D # Load shape file
##D load_shapeaustria()
##D 
##D # Create map plot for mean indicator - point and MSE estimates but no CV
##D map_plot(object = emdi_model, MSE = TRUE, CV = FALSE, 
##D          map_obj = shape_austria_dis, indicator = c("Mean"), 
##D          map_dom_id = "PB")
##D 
##D # Create a suitable mapping table to use numerical identifiers of the shape 
##D # file
##D 
##D # First find the right order
##D dom_ord <- match(shape_austria_dis@data$PB, emdi_model$ind$Domain)
##D 
##D # Create the mapping table based on the order obtained above
##D map_tab <- data.frame(pop_data_id = emdi_model$ind$Domain[dom_ord],
##D                       shape_id = shape_austria_dis@data$BKZ)
##D 
##D # Create map plot for mean indicator - point and CV estimates but no MSE
##D # using the numerical domain identifiers of the shape file
##D 
##D map_plot(object = emdi_model, MSE = FALSE, CV = TRUE, 
##D          map_obj = shape_austria_dis, indicator = c("Mean"), 
##D          map_dom_id = "BKZ", map_tab = map_tab)
##D 
##D         
## End(Not run)



