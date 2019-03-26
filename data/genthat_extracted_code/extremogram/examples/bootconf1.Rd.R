library(extremogram)


### Name: bootconf1
### Title: Confidence bands for the sample univariate extremogram
### Aliases: bootconf1

### ** Examples

# generate a GARCH(1,1) process
omega  = 1
alpha  = 0.1
beta   = 0.6
n      = 1000
quant  = 0.95
type   = 1
maxlag = 70
df     = 3
R      = 10
l      = 30
par    = 0
G = extremogram:::garchsim(omega,alpha,beta,n,df)

extremogram1(G, quant, maxlag, type, 1, 1, 0)
bootconf1(G, R, l, maxlag, quant, type, par, 1, 1, 0.05)



