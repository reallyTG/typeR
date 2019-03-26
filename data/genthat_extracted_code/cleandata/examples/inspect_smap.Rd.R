library(cleandata)


### Name: inspect_smap
### Title: Simply Classify The Columns of A Data Frame
### Aliases: inspect_smap
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
dmap <- inspect_smap(df)
summary(dmap)
print(dmap)



