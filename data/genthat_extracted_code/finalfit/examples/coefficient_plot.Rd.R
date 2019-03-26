library(finalfit)


### Name: coefficient_plot
### Title: Produce a coefficient table and plot
### Aliases: coefficient_plot

### ** Examples

library(finalfit)
library(ggplot2)

# Coefficient plot
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "nodes"
colon_s %>%
	 coefficient_plot(dependent, explanatory)

colon_s %>%
  coefficient_plot(dependent, explanatory, table_text_size=4, title_text_size=14,
    plot_opts=list(xlab("Beta, 95% CI"), theme(axis.title = element_text(size=12))))




