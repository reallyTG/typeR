library(atlantistools)


### Name: plot_diet_bec_dev
### Title: Plot contribution of diet contents for each functional group.
### Aliases: plot_diet_bec_dev

### ** Examples

## Not run: 
##D # Plot SpecMort.txt per ageclass.
##D plots <- plot_diet_bec_dev(preprocess_setas$diet_specmort, wrap_col = "agecl")
##D gridExtra::grid.arrange(plots[[1]])
##D 
##D # Only plot specific species
##D plots <- plot_diet_bec_dev(preprocess_setas$diet_specmort, species = "CEP", wrap_col = "agecl")
##D gridExtra::grid.arrange(plots[[1]])
##D 
##D # Plot SpecMort.txt per stanza First we need to transform the ageclasses to stanzas.
##D d <- system.file("extdata", "setas-model-new-becdev", package = "atlantistools")
##D diet_stanza <- combine_ages(dir = d,
##D                             data = preprocess_setas$diet_specmort,
##D                             col = "pred",
##D                             prm_biol = "VMPA_setas_biol_fishing_New.prm")
##D plots <- plot_diet_bec_dev(diet_stanza, wrap_col = "stanza")
##D gridExtra::grid.arrange(plots[[1]])
## End(Not run)



