library(Inflation)


### Name: INFL.core_tm
### Title: Computes the trimmed means core inflation
### Aliases: INFL.core_tm
### Keywords: average core mean moving trimmed

### ** Examples

ipca_sub <- Inflation::ipca_sub
nuc <- Inflation::INFL.core_tm(subits.var = ipca_sub$ipca_ts, weights = ipca_sub$weights_ts)



