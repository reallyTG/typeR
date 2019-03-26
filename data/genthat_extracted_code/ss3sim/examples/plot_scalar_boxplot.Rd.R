library(ss3sim)


### Name: plot_scalar_boxplot
### Title: Print scalar values as boxplots.
### Aliases: plot_scalar_boxplot

### ** Examples

scalar_dat$depletion <- with(scalar_dat,
  (depletion_om - depletion_em) / depletion_om)
plot_scalar_boxplot(scalar_dat, x = "E", y = "depletion", horiz = "D",
  relative.error = TRUE)



