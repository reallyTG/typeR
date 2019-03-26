library(vipor)


### Name: offsetX
### Title: Offset data using quasirandom noise to avoid overplotting
### Aliases: offsetX offsetSingleGroup

### ** Examples

## Generate fake data
dat <- list(rnorm(50), rnorm(500), c(rnorm(100), rnorm(100,5)), rcauchy(100))
names(dat) <- c("Normal", "Dense Normal", "Bimodal", "Extremes")

## Plot each distribution with a variety of parameters
par(mfrow=c(4,1), mar=c(2,4, 0.5, 0.5))
sapply(names(dat),function(label) {
  y<-dat[[label]]
  
  offsets <- list(
    'Default'=offsetX(y),
    'Smoother'=offsetX(y, adjust=2),
    'Tighter'=offsetX(y, adjust=0.1),
    'Thinner'=offsetX(y, width=0.1)
  )
  ids <- rep(1:length(offsets), sapply(offsets,length))
  
  plot(unlist(offsets) + ids, rep(y, length(offsets)), 
       ylab=label, xlab='', xaxt='n', pch=21, las=1)
  axis(1, 1:4, c("Default", "Adjust=2", "Adjust=0.1", "Width=10%"))
})




