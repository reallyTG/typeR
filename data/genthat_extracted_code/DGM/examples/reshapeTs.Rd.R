library(DGM)


### Name: reshapeTs
### Title: Reshapes a 2D concatenated time series into 3D according to no.
###   of subjects and volumes.
### Aliases: reshapeTs

### ** Examples

# Let's say subjects are concatenated in a 2D matrix
# (samples x nodes), with each having 200 samples.
# generate some sample data
N=20
Nn=5
x = array(rnorm(200*N*Nn), dim=c(200*N,Nn))
ts = reshapeTs(x,N,200)




