library(nontarget)


### Name: adduct.search
### Title: Detecting and grouping adduct m/z relations among peaks in a
###   HRMS dataset
### Aliases: adduct.search

### ** Examples

## No test: 
######################################################
# load required data: ################################
# HRMS peak list: ####################################
data(peaklist)
# list of adducts ####################################
data(adducts) 
######################################################
# run grouping of peaks for different adducts ########
# of the same candidate molecule #####################
adduct<-adduct.search(
  peaklist,
  adducts,
  rttol=0.05,
  mztol=3,
  ppm=TRUE,
  use_adducts=c("M+K","M+H","M+Na","M+NH4"),
  ion_mode="positive"
);
# plot results #######################################
plotadduct(adduct);
######################################################
## End(No test)



