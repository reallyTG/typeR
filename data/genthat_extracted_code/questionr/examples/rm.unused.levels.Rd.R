library(questionr)


### Name: rm.unused.levels
### Title: Remove unused levels
### Aliases: rm.unused.levels

### ** Examples

df <- data.frame(v1=c("a","b","a","b"),v2=c("x","x","y","y"))
df$v1 <- factor(df$v1,c("a","b","c"))
df$v2 <- factor(df$v2,c("x","y","z"))
df
str(df)
str(rm.unused.levels(df))
str(rm.unused.levels(df,"v1"))



