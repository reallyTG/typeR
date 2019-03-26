library(DRomics)
# importation and check of data and normalization if needed
# options to put in shiny : norm.method (4 methods)
## sample of the transcripto data set
datatxt <- system.file("extdata", "transcripto_sample.txt", package="DRomics")
(o <- omicdata(datatxt, check = TRUE, norm.method = "cyclicloess"))
plot(o)
(o.2 <- omicdata(datatxt, check = TRUE, norm.method = "none"))
plot(o.2)
(o.3 <- omicdata(datatxt, check = TRUE, norm.method = "quantile"))
plot(o.3)
(o.4 <- omicdata(datatxt, check = TRUE, norm.method = "scale"))
plot(o.4)

# item selection using the quadratic method
# options to put in shiny : select.method (3 methods), FDR (numerical positive value < 1)
(s_quad <- itemselect(o, select.method = "quadratic", FDR = 0.001))

(s_lin <- itemselect(o, select.method = "linear", FDR = 0.001))
(s_ANOVA <- itemselect(o, select.method = "ANOVA", FDR = 0.001))

# fit of dose response models and choice of the best fit for each item
# no options in shiny
(f <- drcfit(s_quad, progressbar = TRUE))
f$fitres
plot(f)
# Alternative plots
# with a chosen number of first items
plot(f, items = 12) 
# with chosen items in a specified order
plot(f, items = c("301.2", "363.1", "383.1"))

# calculation of benchmark doses
# options in shiny : z (numerical positive value), x (numerical positive value : percentage)
(r <- bmdcalc(f, z = 1, x = 10))
(r.2 <- bmdcalc(f, z = 2, x = 50))


# plot of BMD
# options in shiny : BMDtype (2 possibilities), plottype (3 possibilities), bytypology (TRUE, FALSE)
# hist.bins (integer for hist only)
plot(r, BMDtype = "zSD", plottype = "ecdf", bytypology = FALSE) 
plot(r, BMDtype = "xfold", plottype = "ecdf", bytypology = FALSE) 

plot(r, plottype = "hist", bytypology = FALSE) 
plot(r, plottype = "hist", bytypology = FALSE, hist.bins = 10) 
plot(r, plottype = "density", bytypology = FALSE) 

plot(r, plottype = "hist", bytypology = TRUE, hist.bins = 10) 
