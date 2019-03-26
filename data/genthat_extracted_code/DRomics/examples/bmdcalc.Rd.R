library(DRomics)


### Name: bmdcalc
### Title: Computation of benchmark doses for responsive items
### Aliases: bmdcalc print.bmdcalc plot.bmdcalc

### ** Examples


# (1) a toy example (a very small subsample of a transcriptomics data set) 
#
datatxt <- system.file("extdata", "transcripto_very_small_sample.txt", package="DRomics")

# to test the package on a small (for a quick calculation) but not very small data set
# use the following commented line
# datatxt <- system.file("extdata", "transcripto_sample.txt", package="DRomics")

(o <- omicdata(datatxt, check = TRUE, norm.method = "cyclicloess"))
(s_quad <- itemselect(o, select.method = "quadratic", FDR = 0.01))
(f <- drcfit(s_quad, progressbar = TRUE))
(r <- bmdcalc(f))
plot(r) 

# changing the values of z and x for BMD calculation
(rb <- bmdcalc(f, z = 2, x = 50))
plot(rb) 

# (2) an example on a transcriptomics data set (a subsample of a greater data set) 
#
## No test: 
datatxt <- system.file("extdata", "transcripto_sample.txt", package="DRomics")

# to test the package on a small (for a quick calculation) but not very small data set
# use the following commented line
# datatxt <- system.file("extdata", "transcripto_sample.txt", package="DRomics")

(o <- omicdata(datatxt, check = TRUE, norm.method = "cyclicloess"))
(s_quad <- itemselect(o, select.method = "quadratic", FDR = 0.01))
(f <- drcfit(s_quad, progressbar = TRUE))
(r <- bmdcalc(f))
plot(r) 

# different plots of BMD-zSD

plot(r, plottype = "hist", bytypology = FALSE) 
plot(r, plottype = "density", bytypology = FALSE) 
plot(r, plottype = "hist", bytypology = TRUE) 

# a plot of BMD-xfold (by default BMD-zSD is plotted)
plot(r, BMDtype = "xfold", plottype = "hist", bytypology = TRUE, hist.bins = 10) 
## End(No test)




