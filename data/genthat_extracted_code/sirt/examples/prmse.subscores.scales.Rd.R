library(sirt)


### Name: prmse.subscores.scales
### Title: Proportional Reduction of Mean Squared Error (PRMSE) for
###   Subscale Scores
### Aliases: prmse.subscores.scales
### Keywords: Proportional reduction of mean squared error (PRMSE)

### ** Examples

#############################################################################
# EXAMPLE 1: PRMSE Reading data data.read
#############################################################################

data( data.read )
p1 <- sirt::prmse.subscores.scales(data=data.read,
         subscale=substring( colnames(data.read), 1,1 ) )
print( p1, digits=3 )
  ##                 A       B       C
  ## N         328.000 328.000 328.000
  ## nX          4.000   4.000   4.000
  ## M.X         2.616   2.811   3.253
  ## Var.X       1.381   1.059   1.107
  ## SD.X        1.175   1.029   1.052
  ## alpha.X     0.545   0.381   0.640
  ## [...]
  ## nZ         12.000  12.000  12.000
  ## M.Z         8.680   8.680   8.680
  ## Var.Z       5.668   5.668   5.668
  ## SD.Z        2.381   2.381   2.381
  ## alpha.Z     0.677   0.677   0.677
  ## [...]
  ## cor.TX_Z    0.799   0.835   0.684
  ## rmse.X      0.585   0.500   0.505
  ## rmse.Z      0.522   0.350   0.614
  ## rmse.XZ     0.495   0.350   0.478
  ## prmse.X     0.545   0.381   0.640
  ## prmse.Z     0.638   0.697   0.468
  ## prmse.XZ    0.674   0.697   0.677
#-> Scales A and B do not have lower RMSE,
#   but for scale C the RMSE is smaller than the RMSE of a
#   prediction based on a whole scale.



