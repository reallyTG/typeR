library(cleandata)


### Name: inspect_map
### Title: Classify The Columns of A Data Frame
### Aliases: inspect_map
### Keywords: manip

### ** Examples

# building a data frame
A <- as.factor(c('x', 'y', 'z'))
B <- as.ordered(c('z', 'x', 'y'))
C <- as.factor(c('y', 'z', 'x'))
D <- as.factor(c('i', 'j', 'k'))
E <- 5:7
df <- data.frame(A, B, C, D, E)

# inspection
dmap <- inspect_map(df)
summary(dmap)
print(dmap)



