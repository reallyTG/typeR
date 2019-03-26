library(edpclient)


### Name: stat_type
### Title: Stat Types
### Aliases: stat_type stat_type<-

### ** Examples

  d <- data.frame(x = c(1000, NA, 10000))
  stat_type(d$x) <- "realMultiplicative"
  st <- stat_type(d$x)  # returns "realMultiplicative"
  ## Don't show: 
    stopifnot(st == "realMultiplicative")
  
## End(Don't show)



