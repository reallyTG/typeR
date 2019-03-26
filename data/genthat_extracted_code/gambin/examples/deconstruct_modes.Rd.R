library(gambin)


### Name: deconstruct_modes
### Title: Deconstruct a multimodal gambin model fit
### Aliases: deconstruct_modes

### ** Examples

data(categ)
fits2 = fit_abundances(categ$abundances, no_of_components = 2)
#without species classification data
deconstruct_modes(fits2, dat = categ, peak_val = NULL, abundances = "abundances", 
species = "species", categ = NULL, plot_modes = TRUE)
#with species classification data
deconstruct_modes(fits2, dat = categ, categ = "status", col.statu = c("green", "red", "blue"))
#manually choose modal octaves
deconstruct_modes(fits2, dat = categ, peak_val = c(0,1))



