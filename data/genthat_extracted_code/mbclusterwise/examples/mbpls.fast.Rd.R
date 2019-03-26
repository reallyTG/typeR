library(mbclusterwise)


### Name: mbpls.fast
### Title: Multiblock partial least squares
### Aliases: mbpls.fast
### Keywords: multivariate

### ** Examples

  data(simdata.red) 
  Data.X <- simdata.red[c(1:15, 21:35), 1:10]
  Data.Y <- simdata.red[c(1:15, 21:35), 11:13]
  library(ade4)
  dudiy  <- dudi.pca(df = Data.Y, center = FALSE, scale = FALSE, scannf = FALSE)
  ktabx  <- ktab.data.frame(df = data.frame(Data.X), blocks = c(5,5), 
    tabnames = paste("Tab", c(1:2), sep = "."))
  res    <- mbpls.fast(dudiy, ktabx, scale = FALSE, option = "none", H = 2)



