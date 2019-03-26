library(multgee)


### Name: intrinsic.pars
### Title: Intrinsic Parameters Estimation
### Aliases: intrinsic.pars

### ** Examples

data(arthritis)
intrinsic.pars(y,arthritis,id,time,rscale="ordinal")
## The intrinsic parameters do not differ much. The 'uniform' local odds ratios
## structure might be a good approximation for the association pattern.

set.seed(1)
data(housing)
intrinsic.pars(y,housing,id,time,rscale="nominal")
## The intrinsic parameters vary. The 'RC' local odds ratios structure
## might be a good approximation for the association pattern.



