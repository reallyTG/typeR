library(smoothmest)


### Name: smoothm
### Title: Smoothed and unsmoothed 1-d location M-estimators
### Aliases: smoothm sehuber smhuber mbisquare smbisquare mlcauchy smcauchy
### Keywords: univar robust

### ** Examples

  library(MASS)
  set.seed(10001)
  y <- rdoublex(7)
  median(y)
  huber(y)$mu
  smoothm(y)$mu
  smoothm(y,method="huber")$mu
  smoothm(y,method="bisquare",k=4.685)$mu
  smoothm(y,method="smbisquare",k=4.685,sn=sqrt(1.0526/7))$mu
  smoothm(y,method="cauchy")$mu
  smoothm(y,method="smcauchy",sn=sqrt(2/7))$mu
  smoothm(y,method="smmed",sn=sqrt(1.0526/7))$mu
  smoothm(y,method="smmed",sn=sqrt(1.0526/7),init="mean")$mu



