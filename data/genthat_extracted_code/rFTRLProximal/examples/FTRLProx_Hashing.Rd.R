library(rFTRLProximal)


### Name: FTRLProx_Hashing
### Title: Feature Hashing for FTRL-Proximal Model
### Aliases: FTRLProx_Hashing

### ** Examples

library(data.table)
library(FeatureHashing)
data(ipinyou)
m.train <- FTRLProx_Hashing(~ 0 + ., ipinyou.train[, -"IsClick", with = FALSE],
                            hash.size = 2^13, signed.hash = FALSE, verbose = TRUE)
m.test <- FTRLProx_Hashing(~ 0 + ., ipinyou.test[,-"IsClick", with = FALSE],
                           hash.size = 2^13, signed.hash = FALSE, verbose = TRUE)



