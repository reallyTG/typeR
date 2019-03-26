library(agridat)


### Name: lin.unbalanced
### Title: Multi-environment trial of 33 barley genotypes in 18 locations
### Aliases: lin.unbalanced
### Keywords: datasets

### ** Examples


data(lin.unbalanced)
dat <- lin.unbalanced

# location maximum, lin & binns table 1
aggregate(yield ~ loc, data=dat, FUN=max)

# location 'index', lin & binns, table 1
dat2 <- subset(dat, is.element(dat$gen, c('Bruce','Laurier','Leger','S1','S2',
                                          'S3','S4','S5','S6','S7','T1','T2')))
aggregate(yield ~ loc, data=dat2, FUN=mean)


if(require(reshape2)){
  # calculate the superiority measure of Lin & Binns 1988

  dat3 <- acast(dat, gen ~ loc, value.var="yield")
  #locmean <- apply(dat3, 2, mean)
  locmax <- apply(dat3, 2, max, na.rm=TRUE)
  P <- apply(dat3, 1, function(x) {
    sum((x-locmax)^2, na.rm=TRUE)/(2*length(na.omit(x)))
  })/1000
  P <- sort(P)
  round(P) # match Lin & Binns 1988 table 2, column Pi
 }




