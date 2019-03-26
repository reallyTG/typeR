library(plspolychaos)


### Name: getNames
### Title: Display Structure of a Class
### Aliases: getNames getNames,PCEpoly-method

### ** Examples

### Load the datase
load(system.file("extdata",  "ishigami200.Rda", package="plspolychaos"))
X <- ishi200[, -ncol(ishi200)] # inputs
Y <- ishi200[,  ncol(ishi200)] # output
pce <- polyLeg(X, Y, degree=6)
### Display recursively the names, class and 
### length of all the components.
getNames(pce)



