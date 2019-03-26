library(cleandata)


### Name: encode_ordinal
### Title: Encode Ordinal Data Into Integers
### Aliases: encode_ordinal
### Keywords: manip

### ** Examples

# refer to vignettes if you want to use log files
message('refer to vignettes if you want to use log files')

# building a data frame
A <- as.factor(c('y', 'z', 'x', 'y', 'z'))
B <- as.factor(c('y', 'x', 'z', 'z', 'x'))
C <- as.factor(c('k', 'i', 'i', 'j', 'k'))
df <- data.frame(A, B, C)

# encoding
df[, 1:2] <- encode_ordinal(df[,1:2], order = c('z', 'x', 'y'))
df[, 3] <- encode_ordinal(df[, 3, drop = FALSE], order = c('k', 'j', 'i'))
print(df)



