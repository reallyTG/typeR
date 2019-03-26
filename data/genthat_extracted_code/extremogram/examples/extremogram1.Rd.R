library(extremogram)


### Name: extremogram1
### Title: Sample univariate extremogram
### Aliases: extremogram1

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
G = extremogram:::garchsim(omega,alpha,beta,n,df)

extremogram1(G, quant, maxlag, type, 1, 1, 0)



