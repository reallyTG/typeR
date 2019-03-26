library(numOSL)


### Name: as_analyseBIN
### Title: Transfom SAR data sets into S3 class object "analyseBIN"
### Aliases: as_analyseBIN as_analyseBIN.default
### Keywords: growth curve

### ** Examples

  ### Example 1:
  data(SARdata)
  obj_analyseBIN <- as_analyseBIN(SARdata[1:8,,drop=FALSE])
  res_calSARED <- calSARED(obj_analyseBIN)
  res_calSARED$sarED

  ### Example 2 (not run):
  # obj_analyseBIN <- as_analyseBIN(SARdata)
  # res_calSARED <- calSARED(obj_analyseBIN, rcy1.range=c(1,1), outpdf="SARED")

  ### Example 3 (not run):
  # obj_analyseBIN <- as_analyseBIN(SARdata)
  # res_pickSARdata <- pickSARdata(obj_analyseBIN, fom.up=6, outpdf="SARdata")
  # res_pickSARdata$SARdata



