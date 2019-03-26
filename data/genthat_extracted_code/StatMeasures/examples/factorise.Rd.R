library(StatMeasures)


### Name: factorise
### Title: Change the class of variables to factor
### Aliases: factorise

### ** Examples

# A 'data.frame'
df <- data.frame(x = c(1, 2, 3, 4, 5),
                 y = c('a', 'b', 'c', 'd', 'e'),
                 z = c(1, 1, 0, 0, 1))

# Change the class of variables y and z to factors
dfFac <- factorise(data = df, colNames = c('y', 'z'))



