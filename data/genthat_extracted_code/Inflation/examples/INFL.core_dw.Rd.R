library(Inflation)


### Name: INFL.core_dw
### Title: Computes the double weighted core inflation
### Aliases: INFL.core_dw
### Keywords: core weight

### ** Examples

ipca <- Inflation::ipca_item
nuc <- Inflation::INFL.core_dw(ipca$ipca_index, ipca$ipca_ts, ipca$weights_ts, wind = 12)



