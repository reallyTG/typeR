library(MAT)


### Name: MAT-package
### Title: Multidimensional Adaptive Testing (MAT)
### Aliases: MAT-package
### Keywords: package

### ** Examples

  #load sample item parameters containing 180 items measuring three dimensions
  data(sample.ipar)
  #create a variance-covariance (correlation) matrix  
  vcv1<-diag(3); vcv1[lower.tri(vcv1,diag=FALSE)]<-c(.5,.6,.7) 
  #simulate item responses
  resp1<-simM3PL(sample.ipar, vcv1, 3, n.simulee = 100)$resp 
  #specify target content distributions
  target.content.dist1<-c(1/3,1/3,1/3) 
  #content category designations for items
  content.cat1<-rep(1:3,rep(60,3))
  #simulate multidimensional adaptive testing 
  MCAT.1<-MAT(sample.ipar,
              resp1,
              vcv1,
              target.content.dist=target.content.dist1,
              content.cat=content.cat1,
              ncc=3,
              p=3,
              selectionMethod="A",
              topN=1,
              selectionType="FISHER",
              stoppingCriterion="CONJUNCTIVE",
              minNI=10,
              maxNI=30)
	


