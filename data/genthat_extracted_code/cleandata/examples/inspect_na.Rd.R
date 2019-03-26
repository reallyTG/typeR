library(cleandata)


### Name: inspect_na
### Title: Find Out Which Columns Have Most NAs
### Aliases: inspect_na
### Keywords: manip

### ** Examples

# building a data frame
A <- as.factor(c('y', 'x', 'x', 'y', 'z'))
B <- c(6, 3:6)
C <- 1:5
df <- data.frame(A, B, C)
df[3, 1] <- NA; df[2, 2] <- NA; df[4, 2] <- NA; df [5, 3] <- NA
print(df)

# inspection
a <- inspect_na(df)
print(a)



