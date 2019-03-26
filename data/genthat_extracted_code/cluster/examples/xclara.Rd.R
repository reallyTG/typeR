library(cluster)


### Name: xclara
### Title: Bivariate Data Set with 3 Clusters
### Aliases: xclara
### Keywords: datasets

### ** Examples

## Visualization: Assuming groups are defined as {1:1000}, {1001:2000}, {2001:3000}
plot(xclara, cex = 3/4, col = rep(1:3, each=1000))
p.ID <- c(78, 1411, 2535) ## PAM's medoid indices  == pam(xclara, 3)$id.med
text(xclara[p.ID,], labels = 1:3, cex=2, col=1:3)
## No test: 
 px <- pam(xclara, 3) ## takes ~2 seconds
 cxcl <- px$clustering ; iCl <- split(seq_along(cxcl), cxcl)
 boxplot(iCl, range = 0.7, horizontal=TRUE,
         main = "Indices of the 3 clusters of  pam(xclara, 3)")

 ## Look more closely now:
 bxCl <- boxplot(iCl, range = 0.7, plot=FALSE)
 ## We see 3 + 2 + 2 = 7  clear "outlier"s  or "wrong group" observations:
 with(bxCl, rbind(out, group))
 ## out   1038 1451 1610   30  327  562  770
 ## group    1    1    1    2    2    3    3
 ## Apart from these, what are the robust ranges of indices? -- Robust range:
 t(iR <- bxCl$stats[c(1,5),])
 ##    1  900
 ##  901 2050
 ## 2051 3000
 gc <- adjustcolor("gray20",1/2)
 abline(v = iR, col = gc, lty=3)
 axis(3, at = c(0, iR[2,]), padj = 1.2, col=gc, col.axis=gc)
## End(No test)



