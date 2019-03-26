library(cherry)


### Name: Select with shortcuts
### Title: Confidence limits for the number of true hypotheses, with
###   shortcuts.
### Aliases: pickFisher pickSimes pickMeinshausen curveFisher curveSimes
###   curveMeinshausen
### Keywords: htest

### ** Examples

  # Fisher's method
  data(NAEP)
  pickFisher(NAEP, c("NH", "NC", "IA"))
  pickFisher(NAEP, 1:7)
  curveFisher(NAEP)
  curveFisher(NAEP, order=7:1)


  # Simes method
  hom <- hommelFast(NAEP)
  pickSimes(hom, c("NH", "NC", "IA"))
  pickSimes(hom, 1:7)
  curveSimes(hom)
  curveSimes(hom, select=1:7)
  
  # Meinshausen's method
  # This example uses data from the multtest package on bioconductor
  if(require("multtest")) {
    data(golub)
    smallglb <- golub[1:500,]
    TM<-sapply(1:nrow(smallglb), function(i) {
      mt.sample.teststat(smallglb[i,], golub.cl,test="t.equalvar",B=500)
    })
    PM<-2*(1-pt(abs(TM),df=length(golub.cl)-2)) # permutation matrix
    
    # p-values
    p<-apply(smallglb,1, function(z) t.test(z[golub.cl==0],z[golub.cl==1],var.equal=TRUE)$p.value) 
    
    pickMeinshausen(p, PM, select=1:100)
    pickMeinshausen(p, PM, select=sort.list(p)[1:100])
    curveMeinshausen(p,PM, select=1:200)
    curveMeinshausen(p,PM, order=1:200)
    
  }



