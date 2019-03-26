library(miniGUI)


### Name: makeWidgetCmd
### Title: R functions to build a GUI window
### Aliases: makeWidgetCmd
### Keywords: utilities misc

### ** Examples

  require(tcltk)
  ##
  ##  a simple example
  ## 
  g <- function(a=1,b=rnorm) {cat("--g--");paste("g(a,b)=",a+b(a))}
  h <- function(a=1,b=3,c=3) {cat("--h--");paste("h(a,b,c)=",a+b+c)}
  ## create functions
  gg <- makeWidgetCmd("Hay it is g !!",g,GRAB=FALSE)
  hh <- makeWidgetCmd("Hay h here !!",h,GRAB=FALSE)
  ## calling them
  gg()
  cat("\nClose it before calling hh(), they sharer parameters a and b!!")
  hh()
  ##
  ##  simple example(continuation)
  ##
  ## to be able to use both at the same time:save info for h in other place 
  hh <- makeWidgetCmd("Hay h here !!",h,STORE="h")
  gg()
  hh()



