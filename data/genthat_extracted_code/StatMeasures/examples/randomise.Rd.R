library(StatMeasures)


### Name: randomise
### Title: Order the rows of a data randomly
### Aliases: randomise

### ** Examples

# A 'data.frame'
df <- data.frame(x = c(1, 2, 3, 4, 5), y = c('a', 'b', 'c', 'd', 'e'))

# Change the order of the observations randomly
dfRan <- randomise(data = df)
dfRan <- randomise(data = df, seed = 150)



