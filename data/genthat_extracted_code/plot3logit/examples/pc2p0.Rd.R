library(plot3logit)


### Name: pc2p0
### Title: Computation of starting points of curves of the field
### Aliases: pc2p0 pc2p0_single
### Keywords: internal

### ** Examples

library(magrittr)
# For the categorical logit model
depoDeltaB <- c(0.05, 0.08)
plot3logit:::DeltaB2pc_cat3logit(depoDeltaB) %>%
  plot3logit:::pc2p0(depoDeltaB, flink = list(
    P2XB = plot3logit:::P2XB_cat3logit,
    XB2P = plot3logit:::XB2P_cat3logit))

# For the ordinal logit model
depoDeltaB <- 0.08
depoalpha <- c(-0.4, 0.4)
plot3logit:::DeltaB2pc_ord3logit(depoDeltaB, depoalpha) %>%
  plot3logit:::pc2p0(depoDeltaB, flink = list(
    P2XB = function(x) plot3logit:::P2XB_ord3logit(x, depoalpha),
    XB2P = function(x) plot3logit:::XB2P_ord3logit(x, depoalpha)))




