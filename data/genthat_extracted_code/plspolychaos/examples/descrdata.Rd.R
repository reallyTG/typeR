library(plspolychaos)


### Name: descrdata
### Title: Main Characteristics of the Dataset
### Aliases: descrdata

### ** Examples

### Load the dataset
load(system.file("extdata",  "ishigami200.Rda", package="plspolychaos"))
X <- ishi200[, -ncol(ishi200)] # inputs
Y <- ishi200[,  ncol(ishi200)] # output
### Data characteristics
descrdata(X, Y)



