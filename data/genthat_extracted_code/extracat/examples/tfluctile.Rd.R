library(extracat)


### Name: tfluctile
### Title: Fluctuation diagram with additional dendrograms
### Aliases: tfluctile

### ** Examples

## Not run: 
##D library(amap)
##D hc1 <- hcluster(t(plants[,-1]), method="manhattan", link = "ward")
##D hc2 <- hcluster(t(plants[,-1]), method="manhattan", link = "complete")
##D 
##D hclist <- list(hc1, hc2)
##D tfluctile( tt<-optile(hclist, k= c(8,8) ) )
##D 
##D s1 <- subtree(hc1, k = 12)
##D s2 <- subtree(hc2, k = 10)
##D 
##D tfluctile( table(s1$data, s2$data), tree = list(s1,s2))
## End(Not run)



