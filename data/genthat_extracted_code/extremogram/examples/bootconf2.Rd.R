library(extremogram)


### Name: bootconf2
### Title: Confidence bands for the sample cross extremogram
### Aliases: bootconf2

### ** Examples

# generate a GARCH(1,1) process
omega  = 1
alpha1 = 0.1
beta1  = 0.6
alpha2 = 0.11
beta2  = 0.78
n      = 1000
quant  = 0.95
type   = 1
maxlag = 70
df     = 3
R      = 10
l      = 30
par    = 0
G1     = extremogram:::garchsim(omega,alpha1,beta1,n,df)
G2     = extremogram:::garchsim(omega,alpha2,beta2,n,df)
data   = cbind(G1, G2)

extremogram2(data, quant, quant, maxlag, type, 1, 1, 0)
bootconf2(data, R, l, maxlag, quant, quant, type, par, 1, 1, 0.05)



