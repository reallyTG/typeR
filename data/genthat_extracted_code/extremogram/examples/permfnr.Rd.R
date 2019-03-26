library(extremogram)


### Name: permfnr
### Title: Confidence bands for the sample return time extremogram
### Aliases: permfnr

### ** Examples

# generate a GARCH(1,1) process
omega    = 1
alpha    = 0.1
beta     = 0.6
n        = 1000
uplevel  = 0.95
lowlevel = 0.05
exttype  = 3
maxlag   = 70
type     = 3
m        = 10
df       = 3
G = extremogram:::garchsim(omega,alpha,beta,n,df)

extremogramr(G, type, maxlag, uplevel, lowlevel, 1, 1)
permfnr(G, m, type, exttype, maxlag, uplevel, lowlevel, 1, 0.05)



