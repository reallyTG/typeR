library(cleandata)


### Name: impute
### Title: Impute Missing Values
### Aliases: impute impute_mode impute_median impute_mean
### Keywords: manip

### ** Examples

# refer to vignettes if you want to use log files
message('refer to vignettes if you want to use log files')

# building a data frame
A <- as.factor(c('y', 'x', 'x', 'y', 'z'))
B <- c(6, 3:6)
C <- 1:5
df <- data.frame(A, B, C)
df[3, 1] <- NA; df[2, 2] <- NA; df [5, 3] <- NA
print(df)

# imputation
df0 <- impute_mode(df, cols = 1:3)
print(df0)
df0 <- impute_mode(df, cols = 1:3, idx = 1:3)
print(df0)
df0 <- impute_median(df, cols = 2:3)
print(df0)
df0 <- impute_mean(df, cols = 2:3)
print(df0)



