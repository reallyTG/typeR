library(OpVaR)


### Name: spliced
### Title: Spliced Distributions
### Aliases: dspliced qspliced pspliced rspliced

### ** Examples

##Parameters  for a gh distribution
  A=500 
  B=3
  g=0.2
  h=0.5 
  
  hist(rgh(n=1000,A,B,g,h))
  curve(dgh(x,A,B,g,h),480,520)
  curve(pgh(x,A,B,g,h),480,520)
  curve(qgh(x,A,B,g,h),0,1)



