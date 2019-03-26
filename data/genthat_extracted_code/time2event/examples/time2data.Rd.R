library(time2event)


### Name: time2data
### Title: Classification-based quantitative SILAC analysis
### Aliases: time2data

### ** Examples

  data(pegvhd)

  # convert to data with time-to-event data as covariates
  # os with cgvhd
  tos1data = time2data(c("os.t","os.s"),c("gvhd.t","gvhd.s","pe.t","pe.s"),pegvhd)$data

  data(bmtelder)

  # convert to data with time-to-event data as covariates
  # os with cgvhd
  tos2data = time2data(c("os.t","os.s"),c("cgvhd.t","cgvhd.s"),bmtelder)$data

  # nrm with cgvhd
  tnrm2data = time2data(c("nrm.t","nrm.s"),c("cgvhd.t","cgvhd.s"),bmtelder)$data



