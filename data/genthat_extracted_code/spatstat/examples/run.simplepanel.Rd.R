library(spatstat)


### Name: run.simplepanel
### Title: Run Point-and-Click Interface
### Aliases: clear.simplepanel redraw.simplepanel run.simplepanel
### Keywords: iplot utilities

### ** Examples

  if(interactive()) {
    # make boxes (alternatively use layout.boxes())
    Bminus <- square(1)
    Bvalue <- shift(Bminus, c(1.2, 0))
    Bplus <- shift(Bvalue, c(1.2, 0))
    Bdone <- shift(Bplus, c(1.2, 0))
    myboxes <- list(Bminus, Bvalue, Bplus, Bdone)
    myB <- do.call(boundingbox,myboxes)

    # make environment containing an integer count
    myenv <- new.env()
    assign("answer", 0, envir=myenv)

    # what to do when finished: return the count.
    myexit <- function(e) { return(get("answer", envir=e)) }

    # button clicks
    # decrement the count
    Cminus <- function(e, xy) {
     ans <- get("answer", envir=e)
     assign("answer", ans - 1, envir=e)
     return(TRUE)
   }
   # display the count (clicking does nothing)
   Cvalue <- function(...) { TRUE }
   # increment the count
   Cplus <- function(e, xy) {
    ans <- get("answer", envir=e)
    assign("answer", ans + 1, envir=e)
    return(TRUE)
   }
   # quit button
   Cdone <- function(e, xy) { return(FALSE) }

   myclicks <- list("-"=Cminus,
                    value=Cvalue,
                    "+"=Cplus,
                    done=Cdone)

   # redraw the button that displays the current value of the count
   Rvalue <- function(button, nam, e) {
     plot(button, add=TRUE)
     ans <- get("answer", envir=e)
     text(centroid.owin(button), labels=ans)
     return(TRUE)
  }

  # make the panel
  P <- simplepanel("Counter",
                   B=myB, boxes=myboxes,
                   clicks=myclicks,
                   redraws = list(NULL, Rvalue, NULL, NULL),
                   exit=myexit, env=myenv)
  P

  run.simplepanel(P)
  }



