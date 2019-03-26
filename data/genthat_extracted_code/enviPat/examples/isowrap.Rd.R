library(enviPat)


### Name: isowrap
### Title: Combined (batch) calculation of isotope pattern, envelope and
###   centroids/intensoids/valleys on interpolated resolutions.
### Aliases: isowrap

### ** Examples


data(isotopes);
data(resolution_list);
data(chemforms);
chemforms<-chemforms[1:10];

checked<-check_chemform(
    isotopes,
    chemforms
  );

resmass<-resolution_list[[1]]

centro<-isowrap(
  isotopes,
  checked,
  resmass=resolution_list[[4]],
  resolution=FALSE,
  nknots=4,
  spar=0.2,
  threshold=0.1,
  charge=1,
  emass=0.00054858,
  algo=2,
  ppm=FALSE,
  dmz="get",   # retrieve dm from R=m/dm
  frac=1/4,
  env="Gaussian",
  detect="centroid",
  plotit=TRUE
)





