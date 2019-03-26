library(mkin)


### Name: plot.mkinfit
### Title: Plot the observed data and the fitted model of an mkinfit object
### Aliases: plot.mkinfit plot_sep

### ** Examples

# One parent compound, one metabolite, both single first order, path from
# parent to sink included, use Levenberg-Marquardt for speed
SFO_SFO <- mkinmod(parent = mkinsub("SFO", "m1", full = "Parent"),
                   m1 = mkinsub("SFO", full = "Metabolite M1" ))
fit <- mkinfit(SFO_SFO, FOCUS_2006_D, quiet = TRUE, method.modFit = "Marq")
plot(fit)
plot(fit, show_residuals = TRUE)

# Show the observed variables separately
plot(fit, sep_obs = TRUE, lpos = c("topright", "bottomright"))

# Show the observed variables separately, with residuals
plot(fit, sep_obs = TRUE, show_residuals = TRUE, lpos = c("topright", "bottomright"),
     show_errmin = TRUE)

# The same can be obtained with less typing, using the convenience function plot_sep
plot_sep(fit, lpos = c("topright", "bottomright"))



