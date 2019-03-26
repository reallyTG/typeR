library(rrcovHD)


### Name: soil
### Title: Exchangable cations in forest soil data set
### Aliases: soil
### Keywords: datasets

### ** Examples

data(soil)
soil1983 <- soil[soil$D == 0, -2]       # only 1983, remove column D (always 0)

cc <- CSimca(F~., data=soil, k=c(3,3,1))
cc
pr <- predict(cc, method=2)
tt <- rrcov::mtxconfusion(cc@grp, pr@classification, printit=TRUE)



