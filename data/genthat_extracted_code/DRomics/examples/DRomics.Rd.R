library(DRomics)


### Name: DRomics-package
### Title: Overview of the 'DRomics' package
### Aliases: DRomics DRomics-package

### ** Examples

  ## No test: 


# Step 1: importation, check and normalization of data if need
#
## here cyclicloess normalization of a small transcriptomics data set
## (sample of a real data set)

datatxt <- system.file("extdata", "transcripto_sample.txt", package="DRomics")
(o <- omicdata(datatxt, check = TRUE, norm.method = "cyclicloess"))
plot(o)

# Step 2: item selection using the quadratic method
#
## the quadratic method is the one we preconize to select both
## monotonic and biphasic curves from
## a typical dose-response design (with few replicates per dose)

(s_quad <- itemselect(o, select.method = "quadratic", FDR = 0.001))


# Step 3: fit of dose-response models, choice of the best fit for each curve
# and definition of the typology of response
#

(f <- drcfit(s_quad, progressbar = TRUE))
f$fitres
plot(f)

# Step 4: calculation of x-fold and z-SD benchmark doses 
#

(r <- bmdcalc(f, z = 1, x = 10))
plot(r, BMDtype = "zSD", plottype = "ecdf", bytypology = FALSE) 
plot(r, BMDtype = "xfold", plottype = "hist", bytypology = TRUE, hist.bins = 10) 
## End(No test)


# About using the DRomics-shiny app
# 

if(interactive()) {
  appDir <- system.file("DRomics-shiny", package = "DRomics")
  shiny::runApp(appDir, display.mode = "normal")
}



