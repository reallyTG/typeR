library(TSdist)


### Name: example.database
### Title: Example databases.
### Aliases: example.database example.database zoo.database
### Keywords: datasets

### ** Examples


data(example.database);
data(zoo.database);


## In example.database the series are set in a row-wise format.

plot(example.database)[1,]

## In zoo.database the series are set in a column-wise format.

plot(zoo.database)[,1]




