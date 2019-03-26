library(miniGUI)


### Name: miniGUIinputWidget
### Title: Entry widgets
### Aliases: miniGUIinputWidget miniGUImenusel miniGUIentry miniGUIscale
###   miniGUIdefaultEntry
### Keywords: utilities misc

### ** Examples

  require(tcltk)
  ##
  ##  simple example 
  ##
  #   ...define a function
  h <- function(a=miniGUImenusel(c(1,5,10)),
		b=miniGUIscale(from=5,to=10,by=2),
		c=miniGUIentry(4),
		d=miniGUImenusel(c("T","F")),
                e
		)
  {
    cat("--h--");paste("h(a,b,c)=",d*(a+b+c))
  }
  ## building it
  hmm <- makeWidgetCmd("Hay !!",h)
  hmm()
  ##
  ##  another example
  ##
  ## create some data(in the global environment)
  n <- 100
  d <- data.frame(x=runif(n))
  d$z <- 0.5 * rnorm(n)
  d$y <- 2 * d$x + d$z
  ## def mylm method
  mylm <- lm
  formals(mylm)$method <- quote( miniGUImenusel(c('"qr"','"model.frame"')) )
  formals(mylm)$x <- quote( miniGUImenusel(c("FALSE","TRUE")) )
  ## add this stuff
  miniGUI(evalPlugin,opFuns=list(mylm=mylm,lm=lm)) 




