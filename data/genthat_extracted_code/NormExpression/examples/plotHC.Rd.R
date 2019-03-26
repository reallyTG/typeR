library(NormExpression)


### Name: plotHC
### Title: plotHC
### Aliases: plotHC
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, method = c("spearman", "pearson", "kendall"),
    mar = c(9, 1, 0, 20))
{
    if (!is.data.frame(data))
        data <- data.frame(data)
    method <- match.arg(method)
    hc <- hclust(as.dist(1 - cor(data, method = method)))
    dend <- as.dendrogram(hc)
    dend <- dend %>% set("labels_cex", 6.5) %>% set("branches_lwd",
        6.5)
    par(mar = mar, mgp = c(10, 5, 0), cex.axis = 6)
    plot(dend, horiz = TRUE)
    axis(side = 1, lwd = 8)
  }



