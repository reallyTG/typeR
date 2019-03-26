library(mccmeiv)


### Name: meivm4
### Title: Efficient procedure for estimating parameters for a matched case
###   control design with a mismeasured exposure using instrumental
###   variables
### Aliases: meivm4
### Keywords: Mismeasured Matched Cased Control Instrumental bias

### ** Examples

data(matcdata)
out2=with(matcdata,meivm4(y=y,sv=sv,xs=xs,w=w,z=z,alpha=0.01))
#For running data with multiple confounders/instruments/prognostic factors see 'matcdatamult'.



