library(INDperform)


### Name: plot_model
### Title: Visualization of all IND~pressure-model results relevant for the
###   scoring
### Aliases: plot_model

### ** Examples

# Using some models of the Baltic Sea demo data in this package
mod_tbl <- all_results_ex[4:5, ]
init_tbl <- ind_init_ex[4:5, ]
dat <- plot_model(init_tbl, mod_tbl, pos_label = "topleft")
dat$response_plot[[1]]
dat$predict_plot[[1]]
dat$deriv_plot[[2]]
dat$thresh_plot[[2]]
dat$all_plots[[2]]

## No test: 
 # Apply function to all sign. models and save specific plots
 id <- which(all_results_ex$p_val <= 0.05)
 init_tbl <- ind_init_ex[id, ]
 mod_tbl <- all_results_ex[id, ]
 dat <- plot_model(init_tbl, mod_tbl, pos_label = "bottomright")
 pdf(file.path(tempdir(), "Plot.pdf"), height=10, width=10)
 dat$all_plots
 dev.off()
## End(No test)



