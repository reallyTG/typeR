library(gamlss.dist)


### Name: DBURR12
### Title: The Discrete Burr type XII distribution for fitting a GAMLSS
###   model
### Aliases: DBURR12 dDBURR12 pDBURR12 qDBURR12 rDBURR12
### Keywords: distribution regression

### ** Examples

DBURR12()# 
#plot the pdf using plot 
plot(function(y) dDBURR12(y, mu=10, sigma=1, nu=1), from=0, to=100, n=100+1, type="h") # pdf
# plot the cdf
plot(seq(from=0,to=100),pDBURR12(seq(from=0,to=100), mu=10, sigma=1, nu=1), type="h")   # cdf
# generate random sample
tN <- table(Ni <- rDBURR12(100, mu=5, sigma=1, nu=1))
r <- barplot(tN, col='lightblue')



