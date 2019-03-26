library(rstan)


### Name: Plots
### Title: ggplot2 for RStan
### Aliases: stan_plot stan_trace stan_dens stan_hist stan_scat stan_ac
###   quietgg

### ** Examples

## Not run: 
##D example("read_stan_csv")
##D stan_plot(fit)
##D stan_trace(fit)
##D 
##D library(gridExtra)
##D fit <- stan_demo("eight_schools")
##D 
##D stan_plot(fit)
##D stan_plot(fit, point_est = "mean", show_density = TRUE, fill_color = "maroon")
##D 
##D 
##D # histograms
##D stan_hist(fit)
##D # suppress ggplot2 messages about default bindwidth
##D quietgg(stan_hist(fit))
##D quietgg(h <- stan_hist(fit, pars = "theta", binwidth = 5)) 
##D 
##D # juxtapose histograms of tau and unconstrained tau 
##D tau <- stan_hist(fit, pars = "tau")
##D tau_unc <- stan_hist(fit, pars = "tau", unconstrain = TRUE) + 
##D             xlab("tau unconstrained")
##D grid.arrange(tau, tau_unc)
##D 
##D # kernel density estimates
##D stan_dens(fit)
##D (dens <- stan_dens(fit, fill = "skyblue", ))
##D dens <- dens + ggtitle("Kernel Density Estimates\n") + xlab("")
##D dens
##D 
##D (dens_sep <- stan_dens(fit, separate_chains = TRUE, alpha = 0.3))
##D dens_sep + scale_fill_manual(values = c("red", "blue", "green", "black"))
##D (dens_sep_stack <- stan_dens(fit, pars = "theta", alpha = 0.5,
##D                              separate_chains = TRUE, position = "stack"))
##D 
##D # traceplot
##D trace <- stan_trace(fit)
##D trace +
##D   scale_color_manual(values = c("red", "blue", "green", "black"))
##D trace +
##D   scale_color_brewer(type = "div") +
##D   theme(legend.position = "none")
##D 
##D facet_style <- theme(strip.background = element_rect(fill = "white"),
##D                      strip.text = element_text(size = 13, color = "black"))
##D (trace <- trace + facet_style)
##D 
##D # scatterplot
##D (mu_vs_tau <- stan_scat(fit, pars = c("mu", "tau"), color = "blue", size = 4))
##D mu_vs_tau + 
##D   coord_flip() + 
##D   theme(panel.background = element_rect(fill = "black"))
##D   
## End(Not run)



