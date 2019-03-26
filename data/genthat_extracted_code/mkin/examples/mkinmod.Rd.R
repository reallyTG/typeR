library(mkin)


### Name: mkinmod
### Title: Function to set up a kinetic model with one or more state
###   variables
### Aliases: mkinmod
### Keywords: models

### ** Examples

# Specify the SFO model (this is not needed any more, as we can now mkinfit("SFO", ...)
SFO <- mkinmod(parent = list(type = "SFO"))

# One parent compound, one metabolite, both single first order
SFO_SFO <- mkinmod(
  parent = mkinsub("SFO", "m1"),
  m1 = mkinsub("SFO"))

## Not run: 
##D # The above model used to be specified like this, before the advent of mkinsub()
##D SFO_SFO <- mkinmod(
##D   parent = list(type = "SFO", to = "m1"),
##D   m1 = list(type = "SFO"))
##D 
##D # Show details of creating the C function
##D SFO_SFO <- mkinmod(
##D   parent = mkinsub("SFO", "m1"),
##D   m1 = mkinsub("SFO"), verbose = TRUE)
##D 
##D # If we have several parallel metabolites 
##D # (compare tests/testthat/test_synthetic_data_for_UBA_2014.R)
##D m_synth_DFOP_par <- mkinmod(parent = mkinsub("DFOP", c("M1", "M2")),
##D                            M1 = mkinsub("SFO"),
##D                            M2 = mkinsub("SFO"),
##D                            use_of_ff = "max", quiet = TRUE)
##D 
##D fit_DFOP_par_c <- mkinfit(m_synth_DFOP_par, 
##D                           synthetic_data_for_UBA_2014[[12]]$data,
##D                           quiet = TRUE)
## End(Not run)



