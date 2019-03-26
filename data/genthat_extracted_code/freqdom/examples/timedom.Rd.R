library(freqdom)


### Name: timedom
### Title: Defines a linear filter
### Aliases: timedom
### Keywords: classes

### ** Examples

# In this example we apply the difference operator: Delta X_t= X_t-X_{t-1} to a time series
X = rar(20)
OP = array(0,c(2,2,2))
OP[,,1] = diag(2)
OP[,,2] = -diag(2)
A = timedom(OP, lags = c(0,1))
filter.process(X, A)



