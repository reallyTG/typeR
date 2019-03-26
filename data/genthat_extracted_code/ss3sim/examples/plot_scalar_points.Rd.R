library(ss3sim)


### Name: plot_scalar_points
### Title: Plot scalar values as points.
### Aliases: plot_scalar_points

### ** Examples

scalar_dat$depletion <- with(scalar_dat,
  (depletion_om - depletion_em) / depletion_om)
plot_scalar_points(scalar_dat, x = "E", y = "depletion", horiz = 'D',
  color = "max_grad", relative.error = TRUE)



