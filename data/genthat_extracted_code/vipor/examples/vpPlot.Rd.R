library(vipor)


### Name: vpPlot
### Title: Plot data using offsets by quasirandom noise to generate a
###   violin point plot
### Aliases: vpPlot

### ** Examples

dat<-list(
  'Mean=0'=rnorm(200),
  'Mean=1'=rnorm(50,1),
  'Bimodal'=c(rnorm(40,-2),rnorm(60,2)),
  'Gamma'=rgamma(50,1)
)
labs<-factor(rep(names(dat),sapply(dat,length)),levels=names(dat))
vpPlot(labs,unlist(dat))



