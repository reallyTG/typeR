library(lmomRFA)


### Name: regdata
### Title: The regdata class
### Aliases: regdata as.regdata
### Keywords: misc

### ** Examples

Cascades        # 'Cascades' is of class "regdata"

# Create a data frame with site statistics
dd<-data.frame(
  name      =c("site 1", "site 2", "site 3"),
  n         =c(  20,   30,   40),
  mean      =c( 100,  110,  120),
  LCV       =c(0.20, 0.25, 0.30),
  L_skewness=c(0.15, 0.20, 0.25),
  L_kurtosis=c(0.10, 0.15, 0.20),
  t_5       =c(0.10, 0.12, 0.14))
# Convert to class "regdata"
rdd<-as.regdata(dd)
rdd
class(rdd)



