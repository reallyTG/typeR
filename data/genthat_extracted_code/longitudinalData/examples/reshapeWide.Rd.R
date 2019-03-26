library(longitudinalData)


### Name: reshapeLongToWide
### Title: ~ Function: longToWide (or reshapeWide) ~
### Aliases: reshapeLongToWide longToWide

### ** Examples


summary(Indometh)
longToWide(Indometh)


df2 <- data.frame(id = rep(LETTERS[1:4], rep(2,4)),
                 visit = I(rep(c("3","6"), 4)),
                 x = rnorm(4), y = runif(4),
                 sex=rep(c("H","F","H"),time=c(4,2,2)))[1:7,]
longToWide(df2[,1:3])
longToWide(df2[,c(1,2,4)])



