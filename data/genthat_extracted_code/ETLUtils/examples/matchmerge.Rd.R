library(ETLUtils)


### Name: matchmerge
### Title: Merge two data frames (fast) by common columns by performing a
###   left (outer) join or an inner join.
### Aliases: matchmerge

### ** Examples

left <- data.frame(idlhs = c(1:4, 3:5), a = LETTERS[1:7], stringsAsFactors = FALSE)
right <- data.frame(idrhs = c(1:4), b = LETTERS[8:11], stringsAsFactors = FALSE)
## Inner join
matchmerge(x=left, y=right, by.x = "idlhs", by.y = "idrhs")

## Left outer join in 2 ways
matchmerge(x=left, y=right, by.x = "idlhs", by.y = "idrhs", all.x=TRUE)
matchmerge(x=left, y=right, by.x = left$idlhs, by.y = right$idrhs, all.x=TRUE, by.iskey=TRUE)

## Show usage when y is just a vector instead of a data.frame
matchmerge(x=left, y=right$b, by.x = left$idlhs, by.y = right$idrhs, all.x=TRUE, 
by.iskey=TRUE, add.columns="b.renamed")

## Show speedup difference with merge
## Not run: 
##D size <- 100000 
##D dimension <- seq(Sys.Date(), Sys.Date()+10, by = "day")
##D left <- data.frame(date = rep(dimension, size), sales = rnorm(size))
##D right <- data.frame(date = dimension, feature = dimension-7, feature = dimension-14)
##D dim(left)
##D dim(right)
##D print(system.time(merge(left, right, by.x="date", by.y="date", all.x=TRUE, all.y=FALSE)))
##D print(system.time(matchmerge(left, right, by.x="date", by.y="date", all.x=TRUE, by.iskey=FALSE)))
## End(Not run)
## Show example usage 
products <- expand.grid(product = c("Pepsi", "Coca Cola"), type = c("Can","Bottle"), 
size = c("6Ml","8Ml"), distributor = c("Distri X","Distri Y"), salesperson = c("Mr X","Mr Y"), 
stringsAsFactors=FALSE)
products <- products[!duplicated(products[, c("product","type","size")]), ]
products$key <- paste(products$product, products$type, products$size, sep=".")
sales <- expand.grid(item = unique(products$key), sales = rnorm(10000, mean = 100))
str(products)
str(sales)
info <- matchmerge(x=sales, y=products, 
  by.x=sales$item, by.y=products$key, all.x=TRUE, by.iskey=TRUE, 
  add.columns=c("size","distributor"), check.duplicates=FALSE)
str(info)
tapply(info$sales, info$distributor, FUN=sum)



