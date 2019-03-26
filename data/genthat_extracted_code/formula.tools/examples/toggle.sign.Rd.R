library(formula.tools)


### Name: toggle.sign
### Title: toggle the sign of an expression
### Aliases: toggle.sign

### ** Examples


  toggle.sign(1:3)
  toggle.sign( quote(a) )
  toggle.sign( quote(-a) )
  
  exp <- expression( a, -b, -(a-b) )
  toggle.sign(exp)
  



