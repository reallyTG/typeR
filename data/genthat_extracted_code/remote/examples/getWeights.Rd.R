library(remote)


### Name: getWeights
### Title: Calculate weights from latitude
### Aliases: getWeights

### ** Examples

data("australiaGPCP")
wghts <- getWeights(australiaGPCP)
wghts_rst <- australiaGPCP[[1]]
wghts_rst[] <- wghts

opar <- par(mfrow = c(1,2))
plot(australiaGPCP[[1]], main = "data")
plot(wghts_rst, main = "weights")
par(opar)




