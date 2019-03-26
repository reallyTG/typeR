library(bayesplot)


### Name: PPC-errors
### Title: PPC errors
### Aliases: PPC-errors ppc_error_hist ppc_error_hist_grouped
###   ppc_error_scatter ppc_error_scatter_avg ppc_error_scatter_avg_vs_x
###   ppc_error_binned

### ** Examples

y <- example_y_data()
yrep <- example_yrep_draws()
ppc_error_hist(y, yrep[1:3, ])

# errors within groups
group <- example_group_data()
(p1 <- ppc_error_hist_grouped(y, yrep[1:3, ], group))
p1 + yaxis_text() # defaults to showing counts on y-axis
## No test: 
table(group) # more obs in GroupB, can set freq=FALSE to show density on y-axis
(p2 <- ppc_error_hist_grouped(y, yrep[1:3, ], group, freq = FALSE))
p2 + yaxis_text()
## End(No test)

# scatterplots
ppc_error_scatter(y, yrep[10:14, ])
ppc_error_scatter_avg(y, yrep)

x <- example_x_data()
ppc_error_scatter_avg_vs_x(y, yrep, x)

# ppc_error_binned with binomial model from rstanarm
## Not run: 
##D library(rstanarm)
##D example("example_model", package = "rstanarm")
##D formula(example_model)
##D 
##D # get observed proportion of "successes"
##D y <- example_model$y  # matrix of "success" and "failure" counts
##D trials <- rowSums(y)
##D y_prop <- y[, 1] / trials  # proportions
##D 
##D # get predicted success proportions
##D yrep <- posterior_predict(example_model)
##D yrep_prop <- sweep(yrep, 2, trials, "/")
##D 
##D ppc_error_binned(y_prop, yrep_prop[1:6, ])
## End(Not run)




