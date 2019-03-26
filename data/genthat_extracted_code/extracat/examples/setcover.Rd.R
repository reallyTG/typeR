library(extracat)


### Name: setcover
### Title: greedy setcover optimisation
### Aliases: setcover

### ** Examples

# compute 100 clusterings with 24 clusters each:
sc <- scale(olives[,3:10])
km100 <- as.data.frame(replicate(100, kmeans(sc,centers = 24)$cluster))

# convert to indicator matrix
I100 <- idat(km100)

# select from all clusters a minimum set:
scover <- setcover(as.matrix(I100))


cdata <- subtable(
	as.data.frame(cbind(olives[,1:2],
	I100[,scover])),1:(length(scover)+2))
scpcp(cdata,sel="Area")






