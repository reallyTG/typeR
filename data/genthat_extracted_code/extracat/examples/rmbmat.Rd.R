library(extracat)


### Name: rmbmat
### Title: Pairwise RMB-Plots
### Aliases: rmbmat

### ** Examples

data(olives)


## Not run: 
##D 
##D # mode = "c" piecharts are currently slow
##D 
##D rmbmat(olives, tv=2, mode = "s")
##D 
##D rmbmat(olives[,1:5], tv=2, col ="div", plot.tv = TRUE,
##D  lower.opt = list(tv2 = 1, col ="rgb"))
##D 
##D rmbmat(olives[,c(1:5,11)], tv=2,
##D upper.opt=list(mode="s", eqwidth = TRUE), 
##D rc.opt = list( c5 = list(eqwidth=FALSE,mode="s"),
##D r5 = list(eqwidth=TRUE, mode="s")),allocation=NULL)
## End(Not run)




