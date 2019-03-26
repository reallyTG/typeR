data(nydf)
coords <- as.matrix(nydf[,c("x", "y")])

# code below taken from TangoS.index.R by Tango (2010)
# https://www.niph.go.jp/soshiki/gijutsu/download/Rfunctions/func/TangoS.index

dc <- as.matrix(dist(coords))
kvec = 1
k <- 1
p <- nydf$pop/sum(nydf$pop)
qdat <- nydf$cases/sum(nydf$cases)
nn <- sum(nydf$cases)
w<-diag(p)-p%*%t(p)

rad<- kvec[k]
ac <- exp( -(dc/rad))
hh <- ac%*%w
hh2<- hh%*%hh
av <- sum(diag( hh ))
av2<- sum(diag( hh2 ))
av3<- sum(diag( hh2%*%hh ))
skew1<- 2*sqrt(2)*av3/ (av2)^1.5
df1<- 8/skew1/skew1
eg1<-av
vg1<-2*av2
gt<-(qdat-p)%*%ac%*%(qdat-p)*nn
stat1<-(gt-eg1)/sqrt(vg1)
aprox<-df1+sqrt(2*df1)*stat1

w = dweights(coords, kappa = 1)
results = tango.test(nydf$cases, nydf$pop, w, nsim = 0)

test_that("check accuracy for tango.test for NY data", {
  expect_equal(df1, results$dfc)
  expect_equal(aprox[1,1], results$tstat.chisq)
  })
