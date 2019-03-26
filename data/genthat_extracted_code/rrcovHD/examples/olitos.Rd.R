library(rrcovHD)


### Name: olitos
### Title: Olive Oil Data
### Aliases: olitos
### Keywords: datasets

### ** Examples

data(olitos)
cc <- CSimca(grp~., data=olitos, k=c(3,4,2,2))
cc
pr <- predict(cc, method=2)
tt <- rrcov::mtxconfusion(cc@grp, pr@classification, printit=TRUE)



