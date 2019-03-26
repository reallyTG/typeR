library(verification)


### Name: reliability.plot
### Title: Reliability Plot
### Aliases: reliability.plot reliability.plot.default
###   reliability.plot.verify
### Keywords: file

### ** Examples

## Data from Wilks, table 7.3 page 246.
 y.i   <- c(0,0.05, seq(0.1, 1, 0.1))
 obar.i <- c(0.006, 0.019, 0.059, 0.15, 0.277, 0.377, 0.511,
    0.587, 0.723, 0.779, 0.934, 0.933)

 prob.y <- c(0.4112, 0.0671, 0.1833, 0.0986, 0.0616, 0.0366,
    0.0303,  0.0275, 0.245, 0.022, 0.017, 0.203) 

 obar <- 0.162

reliability.plot(y.i, obar.i, prob.y, titl = "Test 1", legend.names =
c("Model A") )


## Function will work with a ``prob.bin'' class object as well.
## Note this is a very bad forecast.
obs<- round(runif(100))
pred<- runif(100)

A<- verify(obs, pred, frcst.type = "prob", obs.type = "binary")

reliability.plot(A, titl = "Alternative plot")
 




