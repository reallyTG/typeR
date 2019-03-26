library(VGAM)


### Name: plotrcim0
### Title: Main Effects Plot for a Row-Column Interaction Model (RCIM)
### Aliases: plotrcim0

### ** Examples

alcoff.e <- moffset(alcoff, "6", "Mon", postfix = "*")  # Effective day
fit0 <- rcim(alcoff.e, family = poissonff)
## Not run: 
##D par(oma = c(0, 0, 4, 0), mfrow = 1:2)  # For all plots below too
##D ii <- plot(fit0, rcol = "blue", ccol = "orange",
##D            lwd = 4, ylim = c(-2, 2),  # A common ylim
##D            cylab = "Effective daily effects", rylab = "Hourly effects",
##D            rxlab = "Hour", cxlab = "Effective day")
##D ii@post  # Endowed with additional information
## End(Not run)

# Negative binomial example
## Not run: 
##D fit1 <- rcim(alcoff.e, negbinomial, trace = TRUE)
##D plot(fit1, ylim = c(-2, 2)) 
## End(Not run)

# Univariate normal example
fit2 <- rcim(alcoff.e, uninormal, trace = TRUE)
## Not run:  plot(fit2, ylim = c(-200, 400)) 

# Median-polish example
## Not run: 
##D fit3 <- rcim(alcoff.e, alaplace1(tau = 0.5), maxit = 1000, trace = FALSE)
##D plot(fit3, ylim = c(-200, 250)) 
## End(Not run)

# Zero-inflated Poisson example on "crashp" (no 0s in alcoff)
## Not run: 
##D cbind(rowSums(crashp))  # Easy to see the data
##D cbind(colSums(crashp))  # Easy to see the data
##D fit4 <- rcim(Rcim(crashp, rbaseline = "5", cbaseline = "Sun"),
##D              zipoissonff, trace = TRUE)
##D plot(fit4, ylim = c(-3, 3)) 
## End(Not run)



