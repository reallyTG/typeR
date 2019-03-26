library(RSDA)


### Name: generate.sym.table
### Title: Generate a Symbolic Data Table
### Aliases: generate.sym.table
### Keywords: Symbolic Table

### ** Examples

data(example1)
generate.sym.table(example1, file='temp4.csv', sep='|',dec='.', row.names=TRUE,
                   col.names=TRUE)
ex1 <- read.sym.table('temp4.csv', header=TRUE, sep='|',dec='.', row.names=1)



