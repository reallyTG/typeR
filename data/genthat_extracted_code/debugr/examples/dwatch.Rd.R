library(debugr)


### Name: dwatch
### Title: Printing debug outputs during runtime
### Aliases: dwatch

### ** Examples


library(debugr)

# --- A simple example to print the value of an object
myfunction <- function(x) {
  justastring <- "Not much information here"
  z <- 1

  for(i in 1:x) {
    # This call can remain in your code; it is only activated when
    # the debug mode is switched on
    dwatch(crit = "z > 40000", objs = c("z"))
    z <- z * i
  }
  invisible(z)
}

# Turn debug mode on
debugr_switchOn()

# Call function for debugging
myfunction(10)



# --- Applying a function to the object that is printed
myfunction <- function(x) {
  justastring <- "Not much information here"
  z <- 1

  for(i in 1:x) {
    dwatch(crit = "z > 40000", objs = c("z"), funs=c("format"),
    args = as.list(c(big.mark = "\",\"")))
    z <- z * i
  }
  invisible(z)
}

myfunction(10)



# --- Same thing, this time with a expression
myfunction <- function(x) {
  justastring <- "Not much information here"
  z <- 1

  for(i in 1:x) {
    dwatch(crit = "z > 40000", expr=c("format(z, big.mark = \",\")"))
    z <- z * i
  }
  invisible(z)
}

myfunction(10)




