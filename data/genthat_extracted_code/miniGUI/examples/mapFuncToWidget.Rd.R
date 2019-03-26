library(miniGUI)


### Name: mapFuncToWidget
### Title: Map R functions to a GUI window
### Aliases: mapFuncToWidget
### Keywords: utilities misc

### ** Examples

  require(tcltk)
  ##
  ## a window for lm
  ## 
  ## create some data(in the global environment)
  n <- 100
  d <- data.frame(x=runif(n))
  d$z <- 0.5 * rnorm(n)
  d$y <- 2 * d$x + d$z
  ## create a tcltk frame and give it a title
  frm <- tktoplevel()
  tkwm.title(frm,"mapFuncToWidget for lm")
  ## create the GUI window map of lm
  mapFuncToWidget(lm,frm)
  ## ...you may close the window


  ##
  ## a window for T tests
  ##
  myTtest <- function(x,y,mu=0) return( t.test(x=x,y=y,mu=mu) )
  ## create a tcltk frame and give it a title
  frm <- tktoplevel()
  tkwm.title(frm,"mapFuncToWidget for T tests")
  ## create the GUI window map of lm
  mapFuncToWidget(myTtest,frm)
  ## ...you may close the window


  ##
  ##  a simple example
  ## 
  g <- function(a=1,b=rnorm) {cat("--g--");paste("g(a,b)=",a+b(a))}
  h <- function(a=1,b=3,c=3) {cat("--h--");paste("h(a,b,c)=",a+b+c)}
  ## create a tcltk frame and give it a title
  frm <- tktoplevel()
  tkwm.title(frm,"mapFuncToWidget for g")
  ## create the GUI window map of g
  mapFuncToWidget(g,frm)
  ## ...you may close the window


  ##
  ##  the ue of STORE
  ## 
  frm <- tktoplevel()
  tkwm.title(frm,"another map")
  mapFuncToWidget(g,frm,bttLabel="press me !!!")
  ## ... and if you do not close the window
  mapFuncToWidget(h,frm,bttLabel="exec h !!!",STORE="fff")
  ## ...STORE should be added because g and h shares parameter
  ## names a and b
  ## now you may close the window


  ##
  ## a more involved example(see miniGUI widgets)
  ##
  ## some kernels
  kernels <- list(
      gaussK=function(x) dnorm(x,0,1),
      SqK=function(x) ifelse( abs(x) <= 1 , 1 , 0 ),
      EpaK=function(x) ifelse( abs(x) <= 1 , 3/(4*sqrt(5))*(1 - x^2/5) , 0 ),
      TrianK=function(x) ifelse( abs(x) <= 1 , (1 - abs(x)) , 0 )
  )
  ## how to compute the density at x
  prDensEst <- function(x,dat,h,K) mean( K((x-dat)/h) ) / h
  ## the fucntion to appear in the frame
  prDensCurvEst <- function(datos,
     bandwidth=miniGUIscale(from=.05,to=3,by=.05),
     Kernel=miniGUImenusel(c('"gaussK"','"SqK"','"EpaK"','"TrianK"','"QuartK"'))
  )
  {
    n <- length(datos)
    Kernel <- kernels[[Kernel]]
    f <-  function(x) sapply(x,function(x) prDensEst(x,datos,bandwidth,Kernel))
    xeval <- seq(min(datos),max(datos),len=100)
    ##plot pts in x axis
    plot(datos,rep(0,n),pch="+",ylim=c(0,1.25*max(f(xeval))),
         ylab="dens.",main="Density")
    curve(f,add=T)
    return(f)
  }
  formals(prDensCurvEst)$bandwidth <- quote(miniGUIscale(from=.05,to=3,by=.05))
  formals(prDensCurvEst)$Kernel <- quote(
        miniGUImenusel(c('"gaussK"','"SqK"','"EpaK"','"TrianK"','"QuartK"'))
      )
  frm <- tktoplevel()
  tkwm.title(frm,"mapFuncToWidget for f")
  aaa <- mapFuncToWidget(prDensCurvEst,frm)



