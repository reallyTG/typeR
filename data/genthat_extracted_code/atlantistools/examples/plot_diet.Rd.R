library(atlantistools)


### Name: plot_diet
### Title: Plot contribution of diet contents for each functional group.
### Aliases: plot_diet

### ** Examples

## Not run: 
##D plots <- plot_diet(ref_bio_cons, wrap_col = "agecl")
##D gridExtra::grid.arrange(plots[[1]])
##D gridExtra::grid.arrange(plots[[7]])
##D 
##D # Use names() to get the species names!
##D names(plots)
## End(Not run)

plot <- plot_diet(ref_bio_cons, species = "Small planktivorous fish", wrap_col = "agecl")
gridExtra::grid.arrange(plot[[1]])



