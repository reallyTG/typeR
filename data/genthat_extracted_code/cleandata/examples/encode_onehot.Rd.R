library(cleandata)


### Name: encode_onehot
### Title: One-Hot Encoding
### Aliases: encode_onehot
### Keywords: manip

### ** Examples

# refer to vignettes if you want to use log files
message('refer to vignettes if you want to use log files')

# building a data frame
A <- as.factor(c('x', 'y', 'x'))
B <- as.factor(c('i', 'j', 'k'))
df <- data.frame(A, B)

# encoding
df0 <- encode_onehot(df)
df0 <- cbind(df, df0)
print(df0)
df0 <- encode_onehot(df, colname.sep = '-', drop1st = TRUE)
df0 <- cbind(df, df0)
rm(df)
print(df0)



