library(extremogram)


### Name: bootconfr
### Title: Confidence bands for the sample return time extremogram
### Aliases: bootconfr

### ** Examples

# generate a GARCH(1,1) process
omega    = 1
alpha    = 0.1
beta     = 0.6
n        = 1000
uplevel  = 0.95
lowlevel = 0.05
type     = 3
maxlag   = 70
df       = 3
R        = 10
l        = 30
par      = 0
G = extremogram:::garchsim(omega,alpha,beta,n,df)

extremogramr(G, type, maxlag, uplevel, lowlevel, 1, 1)
bootconfr(G, R, l, maxlag, uplevel, lowlevel, type, par, 1, 1, 0.05)



