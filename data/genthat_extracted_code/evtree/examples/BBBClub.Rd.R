library(evtree)


### Name: BBBClub
### Title: Bookbinder's Book Club
### Aliases: BBBClub
### Keywords: datasets

### ** Examples

## Not run: 
##D ## data, packages, random seed
##D data("BBBClub", package = "evtree")
##D library("rpart")
##D set.seed(1090)
##D 
##D ## learn trees
##D ev <- evtree(choice ~ ., data = BBBClub, minbucket = 10, maxdepth = 2)
##D rp <- as.party(rpart(choice ~ ., data = BBBClub, minbucket = 10, model = TRUE))
##D ct <- ctree(choice ~ ., data = BBBClub, minbucket = 10, mincrit = 0.99)
##D 
##D ## visualization
##D plot(ev)
##D plot(rp)
##D plot(ct)
##D 
##D ## accuracy: misclassification rate
##D mc <- function(obj) 1 - mean(predict(obj) == BBBClub$choice)
##D c("evtree" = mc(ev), "rpart" = mc(rp), "ctree" = mc(ct))
##D 
##D ## complexity: number of terminal nodes
##D c("evtree" = width(ev), "rpart" = width(rp), "ctree" = width(ct))
##D 
##D ## compare structure of predictions
##D ftable(tab <- table(evtree = predict(ev), rpart  = predict(rp),
##D   ctree  = predict(ct), observed = BBBClub$choice))
##D 
##D ## compare customer predictions only (absolute, proportion correct)
##D sapply(c("evtree", "rpart", "ctree"), function(nam) {
##D   mt <- margin.table(tab, c(match(nam, names(dimnames(tab))), 4))
##D   c(abs = as.vector(rowSums(mt))[2],
##D     rel = round(100 * prop.table(mt, 1)[2, 2], digits = 3))
##D })
## End(Not run)



