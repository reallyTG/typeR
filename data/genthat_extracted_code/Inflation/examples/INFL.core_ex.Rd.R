library(Inflation)


### Name: INFL.core_ex
### Title: Computes the core inflation using the subitem exclusion method
### Aliases: INFL.core_ex
### Keywords: core exclusion

### ** Examples

ipca <- Inflation::ipca_sub
ipc.ex1 <- Inflation::INFL.core_ex(subits.var = ipca$ipca_ts,
                                   weights = ipca$weights_ts,
                                   info = ipca$cod,
                                   n.blocks = 4,
                                   alpha = 2)




