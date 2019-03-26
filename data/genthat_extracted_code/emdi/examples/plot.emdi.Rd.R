library(emdi)


### Name: plot.emdi
### Title: Plots for an emdi object
### Aliases: plot.emdi

### ** Examples

## Not run: 
##D # Loading data - population and sample data
##D data("eusilcA_pop")
##D data("eusilcA_smp")
##D 
##D # With default setting but na.rm = TRUE; with Box-Cox transformation
##D emdi_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash + self_empl + 
##D unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + fam_allow + 
##D house_allow + cap_inv + tax_adj, pop_data = eusilcA_pop,
##D pop_domains = "district", smp_data = eusilcA_smp, smp_domains = "district", 
##D na.rm = TRUE)
##D 
##D # Example 1: Creation of default diagnostic plots
##D plot(emdi_model)
##D 
##D # Example 2: Creation of diagnostic plots without labels and titles, different colors 
##D # and without Cook's distance plot.
##D plot(emdi_model, label = "no_title", color = c("red", "yellow"), cooks = FALSE)
##D 
##D # Example 3: Creation of diagnostic plots where labels and title differs for 
##D # residual plot
##D plot(emdi_model, label = list(qq_res = c(title = "Pearson resid.", 
##D y_lab = "Quant.", x_lab = "Theo. Quant.")), color = c("red", "yellow"), 
##D cooks = FALSE)
##D 
##D # Example 4: Usage of theme from ggplot2 within plot.emdi
##D library(ggplot2)
##D plot(emdi_model, gg_theme = theme(panel.background = element_rect(fill = "white", 
##D colour = "white"), plot.title = element_text(face = "bold"),
##D title = element_text(color = "navy")))
##D 
## End(Not run)



