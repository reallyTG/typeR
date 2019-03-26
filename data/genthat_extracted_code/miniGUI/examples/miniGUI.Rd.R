library(miniGUI)


### Name: miniGUI
### Title: Simple R GUI
### Aliases: miniGUI doNothingPlugin evalPlugin
### Keywords: utilities misc

### ** Examples

  require(tcltk)
  ##
  ## a simple example 
  ##
  fs <- list(
      f=function(a=1) {cat("--f--");paste("f(a)=",a)},
      g=function(a=1,b=rnorm) {cat("--g--");paste("g(a,b)=",a+b(a))},
      h=function(a=1,b=3,c=3) {cat("--h--");paste("h(a,b,c)=",a+b+c)}
    )
  ## evalPlugin is provided by the package
  miniGUI(evalPlugin,opFuns=fs)

  ##
  ## an example with lm and glm functions
  ##
  ## create some data(in the global environment)
  n <- 100
  d <- data.frame(x=runif(n))
  d$z <- 0.5 * rnorm(n)
  d$y <- 2 * d$x + d$z
  ## makes a wrapper to access t.test
  myTtest <- function(x,y,mu=0) return( t.test(x=x,y=y,mu=mu) )
  ## call miniGUI with myTtest, lm and glm functions
  miniGUI(evalPlugin,opFuns=list("T test"=myTtest,"Lin. Mod."=lm,glm=glm))
  ## try menu "T test" only setting up x

  ##
  ## an example with WRAPFUN set to FALSE
  ##
  gfs <- list()
  for(i in names(fs))
  {
     ## create GUI for fs[[i]] using miniGUIBase
     gfs[[i]] <- makeWidgetCmd(i,fs[[i]],miniGUIBase)
  }
  miniGUI(evalPlugin,opFuns=gfs,WRAPFUN=FALSE) 



