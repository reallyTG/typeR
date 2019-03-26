library(PPCI)


### Name: optidigits_mean_images
### Title: Visualise Cluster Means from optidigits data set
### Aliases: optidigits_mean_images
### Keywords: file

### ** Examples

### not run
run = FALSE
if(run){
  ## load optidigits dataset
  data(optidigits)

  ## obtain a clustering solution using normalised cut hyperplanes
  sol <- ncutdc(optidigits$x, 10)

  ## visualise the cluster means as images
  optidigits_mean_images(sol$cluster)
  }



