library(YaleToolkit)


### Name: big.read.table
### Title: Read in chunks from a large file with row/column filtering to
###   obtain a reasonable-sized data.frame.
### Aliases: big.read.table

### ** Examples

data(CO2)
write.csv(CO2, "CO2.csv", row.names=FALSE)
x <- big.read.table("CO2.csv", nrows=10)
head(x)



