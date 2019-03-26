library(XRJulia)


### Name: JuliaFunction-class
### Title: Proxy Objects in R for Julia Functions
### Aliases: JuliaFunction JuliaFunction-class
###   initialize,JuliaFunction-method

### ** Examples

if(findJulia(test = TRUE)) {
  set.seed(228)
  x <- matrix(rnorm(1000),20,5)
  xm <- juliaSend(x)
  svdJ <- JuliaFunction("svdfact")
  sxm <- svdJ(xm)
  sxm
}



