library(extremogram)


### Name: extremogramr
### Title: Sample return time extremogram
### Aliases: extremogramr

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
G = extremogram:::garchsim(omega,alpha,beta,n,df)

extremogramr(G, type, maxlag, uplevel, lowlevel, 1, 1)



