library(HH)


### Name: pdiscunif
### Title: Discrete Uniform Distribution
### Aliases: pdiscunif qdiscunif ddiscunif rdiscunif
### Keywords: distribution

### ** Examples

  q <- seq(-.5, 7.5, .5)

  pp <- pdiscunif(q, 6)

  ## xyplot(pp ~ q,
  ##        scales=list(
  ##        x=list(at=floor(min(q)):ceiling(max(q))),
  ##        y=list(at=seq(0, 1, .1))))

  qq <- qdiscunif(pp, 6)

  dd <- ddiscunif(q, 6)

  cbind(q, pp, qq, dd)

  rdiscunif(12, 6)



