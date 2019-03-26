library(finalfit)


### Name: ff_plot
### Title: Produce a table and plot
### Aliases: ff_plot finalfit_plot

### ** Examples

# Coefficient plot
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "nodes"
colon_s %>%
	ff_plot(dependent, explanatory)

# Odds ratio plot
dependent = "mort_5yr"
colon_s %>%
	ff_plot(dependent, explanatory)

	# Hazard ratio plot	
dependent = "Surv(time, status)"
colon_s %>%
	ff_plot(dependent, explanatory, dependent_label = "Survival")



