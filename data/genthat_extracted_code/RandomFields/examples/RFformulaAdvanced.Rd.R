library(RandomFields)


### Name: RFformulaAdvanced
### Title: Advanced RFformula
### Aliases: RFformulaAdvanced

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

#################################################################
### the following definitions are needed in all the examples  ###
#################################################################
V <- 10
S <- 0.3
M <- 3
x <- y <- seq(1, 3, 0.1)


#################################################################
###       Example 1: simple example                          ###
#################################################################

## the following to definitions of a model and call of RFsimulate
## give the same result:
model <- RMexp(var=V, scale=S) + M
z1 <- RFsimulate(model = model, x=x, y=y)
plot(z1)


model <- ~ M + RMexp(var=var, scale=sc)
p <- list(var=V, sc=S, M=M)
z2 <- RFsimulate(model = model,x=x, y=y, param=p)
plot(z2)



#################################################################
###       Example 2: formulae within the parameter list       ###
#################################################################

## free parameters (above 'var' and 'sc') can be used
## even within the definition of the list of 'param'eters
model <- ~ RMexp(var=var, sc=sc) + RMnugget(var=nugg)
p <- list(var=V, nugg= ~ var * abs(cos(sc)), sc=S) ## ordering does not matter!
z1 <- RFsimulate(model, x, y, params=p)
plot(z1)
RFgetModel(RFsimulate) ## note that V * abs(cos(S) equals  9.553365

## so the above is equivalent to
model <- ~ RMexp(var=var, sc=sc) + RMnugget(var=var * abs(cos(sc)))
z2 <- RFsimulate(model, x, y, params=list(var=V, sc=S))
plot(z2)



#################################################################
###     Example 3: formulae for fitting (i.e. including NAs)  ###
#################################################################
## first generate some data
model <- ~ RMexp(var=var, sc=sc) + RMnugget(var=nugg)
p <- list(var=V, nugg= ~ var * abs(cos(sc)), sc=S) 
z <- RFsimulate(model, x, y, params=p, n=10)

## estimate the parameters
p.fit <- list(sc = NA, var=NA, nugg=NA)
print(f <- RFfit(model, data=z, params=p.fit))

## estimation with a given boundaries for the scale
p.fit <- list(sc = NA, var=NA, nugg=NA)
lower <- list(sc=0.01)
upper <- list(sc=0.02)
print(f <- RFfit(model, data=z, params=p.fit, lower = lower, upper = upper))




#################################################################
###   Example 4 (cont'd Ex 3): formulae with dummy variables  ###
#################################################################
V <- 10
S <- 0.3
M <- 3
x <- y <- seq(1, 3, 0.1)

model <- ~  RMexp(sc=sc1, var=var) + RMgauss(var=var2, sc=sc2) +
            RMdeclare(u) ## introduces dummy variable 'u'
p.fit <- list(sc1 = NA, var=NA, var2=~2 * u, sc2 = NA, u=NA)
lower <- list(sc1=20, u=5)
upper <- list(sc2=1.5, sc1=100, u=15)
print(f <- RFfit(model, data=z, params=p.fit, lower = lower, upper = upper
                 ))

## Don't show: 
FinalizeExample()
## End(Don't show)




