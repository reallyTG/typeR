library(adegraphics)


### Name: s1d.boxplot
### Title: 1-D box plot of a numeric score partitioned in classes (levels
###   of a factor)
### Aliases: s1d.boxplot
### Keywords: aplot hplot

### ** Examples

data(banque, package = "ade4")
banque.acm <- ade4::dudi.acm(banque, scan = FALSE, nf = 4)
s1d.boxplot(banque.acm$l1[, 1], banque[, 2], psub.text = names(banque)[2], 
  psub.position = "topleft", col = c("red", "blue", "green", "purple", "orange"))
s1d.boxplot(banque.acm$l1[,1], banque[, 1:6], psub.position = "topleft")



