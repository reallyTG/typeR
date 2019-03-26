library(flexclust)


### Name: kcca2df
### Title: Convert Cluster Result to Data Frame
### Aliases: kcca2df
### Keywords: cluster

### ** Examples

c.iris <- cclust(iris[,-5], 3, save.data=TRUE)
df.c.iris <- kcca2df(c.iris)
summary(df.c.iris)
densityplot(~value|variable+group, data=df.c.iris)



