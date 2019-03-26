library(cleandata)


### Name: encode_binary
### Title: Encode Binary Data Into 0 and 1
### Aliases: encode_binary
### Keywords: manip

### ** Examples

# refer to vignettes if you want to use log files
message('refer to vignettes if you want to use log files')

# building a data frame
A <- as.factor(c('x', 'y', 'x'))
B <- as.factor(c('y', 'x', 'y'))
C <- as.factor(c('i', 'j', 'i'))
df <- data.frame(A, B, C)

# encoding
df <- encode_binary(df)
print(df)



