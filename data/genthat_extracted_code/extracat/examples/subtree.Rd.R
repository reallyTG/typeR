library(extracat)


### Name: subtree
### Title: subtrees
### Aliases: subtree

### ** Examples

hc <- hclust(dist(USArrests), "ave")

hcs <- subtree(hc, k = 7)
hcs2 <- subtree(hc, h= 30)

attributes(hcs)
fluctile(table(hcs$data, cutree(hc, k=7)))

par(mfrow=c(1,3))
plot(hc)
plot(hcs)
plot(hcs2)




