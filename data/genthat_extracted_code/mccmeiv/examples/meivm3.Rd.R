library(mccmeiv)


### Name: meivm3
### Title: Two-step methodology for estimating parameters for a matched
###   case control design with a mismeasured exposure using instrumental
###   variables
### Aliases: meivm3
### Keywords: Mismeasured Matched Cased Control Instrumental bias

### ** Examples

data(matcdata)
out=with(matcdata,meivm3(y=y,sv=sv,xs=xs,w=w,z=z,alpha=0.05))
#For running data with multiple confounders/instruments/prognostic factors see 'matcdatamult'.



