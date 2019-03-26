library(Luminescence)


### Name: calc_MinDose
### Title: Apply the (un-)logged minimum age model (MAM) after Galbraith et
###   al. (1999) to a given De distribution
### Aliases: calc_MinDose

### ** Examples


## Load example data
data(ExampleData.DeValues, envir = environment())

# (1) Apply the minimum age model with minimum required parameters.
# By default, this will apply the un-logged 3-parametric MAM.
calc_MinDose(data = ExampleData.DeValues$CA1, sigmab = 0.1)

## Not run: 
##D # (2) Re-run the model, but save results to a variable and turn
##D # plotting of the log-likelihood profiles off.
##D mam <- calc_MinDose(data = ExampleData.DeValues$CA1,
##D                     sigmab = 0.1,
##D                     plot = FALSE)
##D 
##D # Show structure of the RLum.Results object
##D mam
##D 
##D # Show summary table that contains the most relevant results
##D res <- get_RLum(mam, "summary")
##D res
##D 
##D # Plot the log likelihood profiles retroactively, because before
##D # we set plot = FALSE
##D plot_RLum(mam)
##D 
##D # Plot the dose distribution in an abanico plot and draw a line
##D # at the minimum dose estimate
##D plot_AbanicoPlot(data = ExampleData.DeValues$CA1,
##D                  main = "3-parameter Minimum Age Model",
##D                  line = mam,polygon.col = "none",
##D                  hist = TRUE,
##D                  rug = TRUE,
##D                  summary = c("n", "mean", "mean.weighted", "median", "in.ci"),
##D                  centrality = res$de,
##D                  line.col = "red",
##D                  grid.col = "none",
##D                  line.label = paste0(round(res$de, 1), "\U00B1",
##D                                      round(res$de_err, 1), " Gy"),
##D                  bw = 0.1,
##D                  ylim = c(-25, 18),
##D                  summary.pos = "topleft",
##D                  mtext = bquote("Parameters: " ~
##D                                   sigma[b] == .(get_RLum(mam, "args")$sigmab) ~ ", " ~
##D                                   gamma == .(round(log(res$de), 1)) ~ ", " ~
##D                                   sigma == .(round(res$sig, 1)) ~ ", " ~
##D                                   rho == .(round(res$p0, 2))))
##D 
##D 
##D 
##D # (3) Run the minimum age model with bootstrap
##D # NOTE: Bootstrapping is computationally intensive
##D # (3.1) run the minimum age model with default values for bootstrapping
##D calc_MinDose(data = ExampleData.DeValues$CA1,
##D              sigmab = 0.15,
##D              bootstrap = TRUE)
##D 
##D # (3.2) Bootstrap control parameters
##D mam <- calc_MinDose(data = ExampleData.DeValues$CA1,
##D                     sigmab = 0.15,
##D                     bootstrap = TRUE,
##D                     bs.M = 300,
##D                     bs.N = 500,
##D                     bs.h = 4,
##D                     sigmab.sd = 0.06,
##D                     plot = FALSE)
##D 
##D # Plot the results
##D plot_RLum(mam)
##D 
##D # save bootstrap results in a separate variable
##D bs <- get_RLum(mam, "bootstrap")
##D 
##D # show structure of the bootstrap results
##D str(bs, max.level = 2, give.attr = FALSE)
##D 
##D # print summary of minimum dose and likelihood pairs
##D summary(bs$pairs$gamma)
##D 
##D # Show polynomial fits of the bootstrap pairs
##D bs$poly.fits$poly.three
##D 
##D # Plot various statistics of the fit using the generic plot() function
##D par(mfcol=c(2,2))
##D plot(bs$poly.fits$poly.three, ask = FALSE)
##D 
##D # Show the fitted values of the polynomials
##D summary(bs$poly.fits$poly.three$fitted.values)
## End(Not run)




