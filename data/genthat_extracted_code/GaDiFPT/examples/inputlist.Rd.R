library(GaDiFPT)


### Name: inputlist
### Title: User provided parameters
### Aliases: inputlist print.inputlist t0 x0 Tfin deltat M quadflag
###   RStudioflag

### ** Examples

## Creating a list of parameters for the Wiener process

mu <- 0.0
sigma2 <- 1.0
Stype <- "constant"
t0 <- 0.0
x0 <- 0.0
Tfin <- 4000    
deltat <- 1.0
M <- 1000
quadflag <- 1
RStudioflag <- TRUE

# building an object of \dQuote(inputlist) class and printing a summary of its parameters

param <- inputlist(mu,sigma2,Stype,t0,x0,Tfin,deltat,M,quadflag,RStudioflag)

print(param)



