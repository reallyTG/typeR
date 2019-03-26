library(finalfit)


### Name: or_plot
### Title: Produce an odds ratio table and plot
### Aliases: or_plot

### ** Examples

library(finalfit)
library(dplyr)
library(ggplot2)

# OR plot
data(colon_s)
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"
colon_s %>%
	 or_plot(dependent, explanatory)

colon_s %>%
  or_plot(dependent, explanatory, table_text_size=4, title_text_size=14,
    plot_opts=list(xlab("OR, 95% CI"), theme(axis.title = element_text(size=12))))




