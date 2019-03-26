library(sonicLength)


### Name: Fragment Distribution
### Title: Simple Fragment Length Distribution
### Aliases: dfrag qfrag rfrag pfrag
### Keywords: distribution

### ** Examples

  
  plot( 0:300, table(factor(rfrag(2000),0:300)) )
  lines( 0:300, 2000*dfrag(0:300) )
  
  


