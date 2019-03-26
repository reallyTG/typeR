library(data.table)


### Name: subset.data.table
### Title: Subsetting data.tables
### Aliases: subset subset.data.table
### Keywords: data

### ** Examples


DT <- data.table(a=sample(c('a', 'b', 'c'), 20, replace=TRUE),
                 b=sample(c('a', 'b', 'c'), 20, replace=TRUE),
                 c=sample(20), key=c('a', 'b'))

sub <- subset(DT, a == 'a')
all.equal(key(sub), key(DT))



