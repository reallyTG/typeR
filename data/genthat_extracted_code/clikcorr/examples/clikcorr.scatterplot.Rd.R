library(clikcorr)


### Name: splot
### Title: Graphical function for visualizing bivariate censored and/or
###   missing data
### Aliases: splot

### ** Examples


data(ND)
logND <- log(ND)

splot(logND, c("t1_OCDD", "t1_TCDF", "t1_HxCDF_234678"),
 c("t2_OCDD", "t2_TCDF", "t2_HxCDF_234678"), ti="scatter plot matrix")

splot(logND, c("t1_OCDD", "t1_TCDF", "t1_HxCDF_234678"),
 c("t2_OCDD", "t2_TCDF", "t2_HxCDF_234678"), ti="scatter plot matrix", bg="gold")




