library(assignPOP)


### Name: compile.data
### Title: Compile genetic and other non-genetic data
### Aliases: compile.data

### ** Examples

genin <- read.Genepop(system.file("extdata/TinyGenepop.txt", package="assignPOP"))
comin <- compile.data(x=genin, add.x=system.file("extdata/TinyVars.csv", package="assignPOP"))
#Change file 'TinyVars' to 'morphData' to get the example used in the tutorial.



