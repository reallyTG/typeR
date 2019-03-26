library(StatMeasures)


### Name: rmdupkey
### Title: Remove observations with duplicate keys from data
### Aliases: rmdupkey

### ** Examples

# A 'data.frame'
df <- data.frame(x = c(1, 2, 1, 1), y = c(3, 3, 1, 3))

# Remove duplicate observations by key from data
ltDf <- rmdupkey(data = df, by = c('x'))
unqDf <- ltDf$unqData
dupDf <- ltDf$dupData



