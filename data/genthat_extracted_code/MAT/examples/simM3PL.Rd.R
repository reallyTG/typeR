library(MAT)


### Name: simM3PL
### Title: Simulate M3PL item responses
### Aliases: simM3PL
### Keywords: Psychometrics IRT

### ** Examples

  data(sample.ipar)
  vcv1<-diag(3)
  vcv1[lower.tri(vcv1,diag=FALSE)]<-c(.5,.6,.7)
  resp1<-simM3PL(sample.ipar, vcv1, 3, n.simulee = 100, seed = 1234)$resp



