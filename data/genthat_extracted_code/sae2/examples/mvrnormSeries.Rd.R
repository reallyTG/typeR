library(sae2)


### Name: mvrnormSeries
### Title: Generate data under the Dynamic or Rao-Yu Time Series Models
### Aliases: mvrnormSeries

### ** Examples

set.seed(7)
mvrnormSeries(D=2, T=5, sigma.e=diag(5), rho.dyn=.8,
    sigma.v.dyn=2, sigma.u.dyn=.72)
mvrnormSeries(NV=2, D=2, T=5, sigma.e=diag(10), rho.dyn=.8,
    sigma.v.dyn=2, sigma.u.dyn=.72, rho.u.dyn=.8)



