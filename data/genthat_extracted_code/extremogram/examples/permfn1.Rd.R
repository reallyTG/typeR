library(extremogram)


### Name: permfn1
### Title: Confidence bands for the sample univariate extremogram
### Aliases: permfn1

### ** Examples

# generate a GARCH(1,1) process
omega   = 1
alpha   = 0.1
beta    = 0.6
n       = 1000
quant   = 0.95
exttype = 1
maxlag  = 70
df      = 3
type    = 3
m       = 10
G = extremogram:::garchsim(omega,alpha,beta,n,df)

extremogram1(G, quant, maxlag, exttype, 1, 1, 0)
permfn1(G, quant, m, type, exttype, maxlag, 1, 0.05)



