### R code from vignette source 'seriation.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: seriation.Rnw:120-123
###################################################
options(scipen=3, digits=4)
### for sampling
set.seed(1234)


###################################################
### code chunk number 2: seriation.Rnw:1025-1026
###################################################
set.seed(1234)


###################################################
### code chunk number 3: seriation.Rnw:1029-1035
###################################################
library("seriation")

data("iris")
x <- as.matrix(iris[-5])
x <- x[sample(seq_len(nrow(x))),]
d <- dist(x)


###################################################
### code chunk number 4: seriation.Rnw:1041-1043
###################################################
o <- seriate(d)
o


###################################################
### code chunk number 5: seriation.Rnw:1054-1055
###################################################
head(get_order(o), 15)


###################################################
### code chunk number 6: pimage1
###################################################
pimage(d, main = "Random")


###################################################
### code chunk number 7: pimage1-2
###################################################
pimage(d, o, main = "Reordered")


###################################################
### code chunk number 8: seriation.Rnw:1080-1081
###################################################
cbind(random = criterion(d), reordered = criterion(d, o))


###################################################
### code chunk number 9: pimage2
###################################################
pimage(scale(x), main = "Random")


###################################################
### code chunk number 10: pimage2-2
###################################################
o_2mode <- c(o, NA)
pimage(scale(x), o_2mode, main = "Reordered")


###################################################
### code chunk number 11: seriation.Rnw:1130-1132
###################################################
methods <- c("TSP","R2E", "ARSA", "HC", "GW", "OLO")
o <- sapply(methods, FUN = function(m) seriate(d, m))


###################################################
### code chunk number 12: seriation.Rnw:1135-1137
###################################################
timing <- sapply(methods, FUN = function(m) system.time(seriate(d, m)),
    simplify = FALSE)


###################################################
### code chunk number 13: pimage3-pre (eval = FALSE)
###################################################
## o <- ser_align(o)
## for(s in o) pimage(d, s, main = get_method(s), key = FALSE)


###################################################
### code chunk number 14: pimage3
###################################################
o <- ser_align(o)
for(i in 1:length(o)) {
    pdf(file=paste("seriation-pimage_comp_", i , ".pdf", sep=""))
    pimage(d, o[[i]], main = get_method(o[[i]]), key = FALSE)
    dev.off()
}


###################################################
### code chunk number 15: seriation.Rnw:1266-1268
###################################################
crit <- sapply(o, FUN = function(x) criterion(d, x))
t(crit)


###################################################
### code chunk number 16: crit1
###################################################
def.par <- par(no.readonly = TRUE)
m <- c("Path_length", "AR_events", "Moore_stress")
layout(matrix(seq_along(m), ncol=1))
#tmp <- apply(crit[m,], 1, dotchart, sub = m)
tmp <- lapply(m, FUN = function(i) dotchart(crit[i,], sub = i))
par(def.par)


###################################################
### code chunk number 17: seriation.Rnw:1309-1311
###################################################
show_seriation_methods("dist")[1:3]
show_seriation_methods("matrix")[1:3]


###################################################
### code chunk number 18: seriation.Rnw:1318-1319
###################################################
list_seriation_methods("dist")


###################################################
### code chunk number 19: seriation.Rnw:1335-1338
###################################################
seriation_method_reverse <- function(x, control = NULL) {
           lapply(dim(x), function(n) rev(seq(n)))
}


###################################################
### code chunk number 20: seriation.Rnw:1346-1351
###################################################
set_seriation_method("matrix", "Reverse", seriation_method_reverse,
    "Reverse identity order")

set_seriation_method("array", "Reverse", seriation_method_reverse,
    "Reverse identity order")


###################################################
### code chunk number 21: seriation.Rnw:1356-1363
###################################################
show_seriation_methods("matrix")

o <- seriate(matrix(1, ncol=3, nrow=4), "reverse")
o

get_order(o, 1)
get_order(o, 2)


###################################################
### code chunk number 22: seriation.Rnw:1397-1398
###################################################
x <- scale(x, center = FALSE)


###################################################
### code chunk number 23: seriation.Rnw:1405-1406 (eval = FALSE)
###################################################
## hmap(x, margin =c(7, 4), cexCol=1, labRow = FALSE)


###################################################
### code chunk number 24: seriation.Rnw:1416-1417 (eval = FALSE)
###################################################
## hmap(x, method = "MDS")


###################################################
### code chunk number 25: seriation.Rnw:1427-1432
###################################################
#bitmap(file = "seriation-heatmap1.png", type = "pnggray",
#    height = 6, width = 6, res = 300, pointsize=14)
pdf(file = "seriation-heatmap1.pdf")
hmap(x, margin = c(7, 4), labRow = FALSE, cexCol=1)
tmp <- dev.off()


###################################################
### code chunk number 26: seriation.Rnw:1434-1437
###################################################
pdf(file = "seriation-heatmap2.pdf")
hmap(x, method="MDS")
tmp <- dev.off()


###################################################
### code chunk number 27: seriation.Rnw:1503-1505
###################################################
data("Irish")
orig_matrix <- apply(Irish[,-6], 2, rank)


###################################################
### code chunk number 28: seriation.Rnw:1515-1520
###################################################
o <- c(
    seriate(dist(orig_matrix, "minkowski", p = 1), method ="TSP"),
    seriate(dist(t(orig_matrix), "minkowski", p = 1), method = "TSP")
)
o


###################################################
### code chunk number 29: seriation.Rnw:1525-1527 (eval = FALSE)
###################################################
## bertinplot(orig_matrix)
## bertinplot(orig_matrix, o)


###################################################
### code chunk number 30: bertin1
###################################################
bertinplot(orig_matrix)


###################################################
### code chunk number 31: bertin2
###################################################
bertinplot(orig_matrix, o)


###################################################
### code chunk number 32: binary1
###################################################
data("Townships")

bertinplot(Townships, options = list(panel=panel.squares, spacing = 0,
    frame = TRUE))


###################################################
### code chunk number 33: seriation.Rnw:1605-1607
###################################################
## to get consistent results
set.seed(5)


###################################################
### code chunk number 34: binary2
###################################################
o <- seriate(Townships, method = "BEA", control = list(rep = 10))
bertinplot(Townships, o, options = list(panel=panel.squares, spacing = 0,
    frame = TRUE))


###################################################
### code chunk number 35: seriation.Rnw:1647-1648
###################################################
rbind(original = criterion(Townships), reordered = criterion(Townships, o))


###################################################
### code chunk number 36: seriation.Rnw:1715-1718
###################################################
data("iris")
iris <- iris[sample(seq_len(nrow(iris))),]
d <- dist(as.matrix(iris[-5]), method = "euclidean")


###################################################
### code chunk number 37: dissplot1 (eval = FALSE)
###################################################
## ## plot original matrix
## dissplot(d, method = NA)


###################################################
### code chunk number 38: dissplot2 (eval = FALSE)
###################################################
## ## plot reordered matrix
## dissplot(d, options = list(main = "Dissimilarity plot with seriation"))


###################################################
### code chunk number 39: seriation.Rnw:1740-1746
###################################################
pdf(file = "seriation-dissplot1.pdf")
## plot original matrix
dissplot(d, method = NA)
tmp <- dev.off()
pdf(file = "seriation-dissplot2.pdf")
## plot reordered matrix
dissplot(d, options = list(main = "Dissimilarity plot with seriation"))
tmp <- dev.off()


###################################################
### code chunk number 40: seriation.Rnw:1773-1774
###################################################
set.seed(1234)


###################################################
### code chunk number 41: seriation.Rnw:1776-1778
###################################################
l <- kmeans(d, 10)$cluster
#$


###################################################
### code chunk number 42: dissplot3 (eval = FALSE)
###################################################
## res <- dissplot(d, labels = l,
##     options = list(main = "Dissimilarity plot - standard"))


###################################################
### code chunk number 43: seriation.Rnw:1791-1804
###################################################
pdf(file = "seriation-dissplot3.pdf")

## visualize the clustering
res <- dissplot(d, labels = l,
    options = list(main = "Dissimilarity plot - standard"))
tmp <- dev.off()


pdf(file = "seriation-dissplot4.pdf")
## threshold
plot(res, options = list(main = "Dissimilarity plot - threshold",
    threshold = 1.5))

tmp <- dev.off()


###################################################
### code chunk number 44: seriation.Rnw:1819-1820
###################################################
res


###################################################
### code chunk number 45: seriation.Rnw:1839-1841 (eval = FALSE)
###################################################
## plot(res, options = list(main = "Seriation - threshold",
##     threshold = 1.5))


###################################################
### code chunk number 46: seriation.Rnw:1855-1858
###################################################
#names(res)
table(iris[res$order, 5], res$label)[,res$cluster_order]
#$


###################################################
### code chunk number 47: ruspini
###################################################
data("ruspini", package="cluster")
d <- dist(ruspini)
l <- kmeans(d, 3)$cluster
dissplot(d, labels = l)


