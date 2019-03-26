library(CTT)


### Name: subscales
### Title: Function to create subscales based on a design matrix
### Aliases: subscales
### Keywords: misc

### ** Examples

# Example data included with package
data(CTTdata)
data(CTTkey)

# design matrix
q <- matrix(c(1,0,
              1,0,
              1,0,
              1,0,
              1,0,
              1,0,
              1,0,
              1,0,
              1,0,
              1,1,
              0,1,
              0,1,
              0,1,
              0,1,
              0,1,
              0,1,
              0,1,
              0,1,
              0,1,
              0,1), ncol=2, byrow=TRUE)
subscales(CTTdata,q,c("T1","T2"),TRUE,TRUE,CTTkey)



