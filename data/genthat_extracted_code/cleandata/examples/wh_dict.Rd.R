library(cleandata)


### Name: wh_dict
### Title: Create Data Dictionary from Data Warehouse
### Aliases: wh_dict
### Keywords: manip

### ** Examples

# refer to vignettes if you want to use log files
message('refer to vignettes if you want to use log files')

# building a data frame
A <- c('i', 'j', 'i', 'k', 'j')
B <- as.factor(c('x', 'y', 'x', 'z', 'y'))
C <- 1:5
df <- data.frame(A, B, C)
print(df)

# encoding
dict <- wh_dict(df, attr = 'B', value = 'A')
print(dict)



