library(spectacles)


### Name: base_line
### Title: Baseline correction using the baseline package#'
### Aliases: base_line base_line,Spectra-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Subsample for demo purposes
australia <- australia[1:10,]

# Correction using the default method (irls)
bl <- base_line(australia)
plot(bl)

# Specifying another method for baseline calculation
bl2 <- base_line(australia, method = "modpolyfit")
plot(bl2)

# Using the baseline package independently (useful to plot the corrections)
## Not run: 
##D library(baseline)
##D bl3 <- baseline(spectra(australia), method = 'irls')
##D class(bl3) # this is a baseline object
##D plot(bl3)
##D # Affecting the baseline-corrected spectra back
##D # to the SpectraDataFrame object
##D spectra(australia) <- getCorrected(bl3)
##D plot(australia)
##D 
##D # Using the baselineGUI with inspectr
##D baselineGUI(spectra(australia))
##D ## When happy with a configuration, clik "Apply to all" and 
##D ## save the results under a name, e.g. "corrected.spectra"
##D spectra(australia) <- getCorrected(corrected.spectra)
##D plot(australia)
## End(Not run)




