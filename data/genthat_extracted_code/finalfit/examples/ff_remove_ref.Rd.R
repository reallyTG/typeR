library(finalfit)


### Name: ff_remove_ref
### Title: Remove regression reference level row from table
### Aliases: ff_remove_ref finalfit_remove_ref

### ** Examples

# Table example
explanatory = c("age.factor", "age", "sex.factor", "nodes", "obstruct.factor", "perfor.factor")
dependent = 'mort_5yr'
colon_s %>%
	 finalfit(dependent, explanatory, add_dependent_label = FALSE) %>%
	 ff_remove_ref() %>%
	 dependent_label(colon_s, dependent)
	
# Plot example
explanatory = c("age.factor", "age", "sex.factor", "nodes", "obstruct.factor", "perfor.factor")
dependent = 'mort_5yr'
colon_s %>% 
  summary_factorlist(dependent, explanatory, total_col = TRUE, fit_id=TRUE) %>% 
  ff_merge(
    glmuni(colon_s, dependent, explanatory) %>% 
    fit2df()) %>% 
  ff_remove_ref() %>% 
  dplyr::select(-`OR`) -> factorlist_plot

colon_s %>% 
   or_plot(dependent, explanatory, factorlist = factorlist_plot)



