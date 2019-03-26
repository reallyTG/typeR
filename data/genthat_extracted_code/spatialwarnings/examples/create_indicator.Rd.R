library(spatialwarnings)


### Name: create_indicator
### Title: Custom Spatial Early-Warning signals
### Aliases: create_indicator custom_indicator plot.custom_sews_list
###   indictest.custom_sews plot.custom_sews_test

### ** Examples


# Use the maximum patch size as indicator of degradation
maxpatchsize <- function(mat) { 
  # Note that we explicitely convert mat here to logical as it can be 
  # transformed into numeric internally. 
  max(patchsizes(mat > 0))
}

# Create the indicator function
maxpatch_sews <- create_indicator(maxpatchsize)

# Then work with this function as if it were a function from the *_sews 
# family. 
mp_indic <- maxpatch_sews(forestgap)
summary(mp_indic)

## Not run: 
##D  
##D # Assess significance and display trends
##D options(mc.cores = 2)
##D mp_test <- indictest(mp_indic, nperm = 49)
##D plot(mp_test)
## End(Not run)



# Try spatial coefficient of variation as a spatial EWS. This function can 
# have arguments. 
spatial_cv <- function(mat, subsize) { 
  matc <- coarse_grain(mat, subsize)
  return( sd(matc) / mean(matc) )
}

# Create indicator function
cv_sews <- create_indicator(spatial_cv)

# Compute and display trends
cv_indic <- cv_sews(serengeti, subsize = 3)
plot(cv_indic, along = serengeti.rain)

# We can do the same work in one run using custom_indicator
cv_indic2 <- custom_indicator(serengeti, spatial_cv, subsize = 3)
plot(cv_indic2, along = serengeti.rain)

## Not run: 
##D  
##D indictest(cv_indic, nperm = 99)
## End(Not run)



