library(spatstat.utils)


### Name: termsinformula
### Title: Manipulate Formulae
### Aliases: termsinformula offsetsinformula variablesinformula
###   lhs.of.formula lhs.of.formula<- rhs.of.formula rhs.of.formula<-
###   can.be.formula identical.formulae
### Keywords: utilities

### ** Examples

  f <- (y ~ x + z*w + offset(h))
  lhs.of.formula(f)
  rhs.of.formula(f)
  variablesinformula(f)  
  termsinformula(f)
  offsetsinformula(f)
  g <- f
  environment(g) <- new.env()
  identical(f,g)
  identical.formulae(f,g)
  lhs.of.formula(f) <- quote(mork) # or as.name("mork")
  f
  rhs.of.formula(f) <- quote(x+y+z) # or parse(text="x+y+z")[[1]]
  f



