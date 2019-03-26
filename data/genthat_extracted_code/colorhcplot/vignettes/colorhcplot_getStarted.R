## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----first install, eval=FALSE, include=TRUE-----------------------------
#  install.packages("colorhcplot")
#  library(colorhcplot)

## ----gooo, eval=TRUE, include=FALSE, echo=FALSE--------------------------
library(colorhcplot)

## ----first example, fig.align='center', fig.width=7.2, fig.height=4.5----
data(USArrests)
hc <- hclust(dist(USArrests), "ave")
fac <- as.factor(c(rep("group 1", 10), 
                   rep("group 2", 10), 
                   rep("unknown", 30)))
plot(hc)
colorhcplot(hc, fac)
colorhcplot(hc, fac, hang = -1, lab.cex = 0.8)

## ----second example, fig.align='center', fig.width=6.5, fig.height=4-----
data(UScitiesD)
hcity.D2 <- hclust(UScitiesD, "ward.D2")
fac.D2 <-as.factor(c(rep("group1", 3), 
                     rep("group2", 7)))
plot(hcity.D2, hang=-1)
colorhcplot(hcity.D2, fac.D2, color = c("chartreuse2", "orange2"))
colorhcplot(hcity.D2, fac.D2, color = "gray30", lab.cex = 1.2, lab.mar = 0.75)

## ----thirs example, fig.align='center', fig.width=7, fig.height=4.5------
data(geneData, package="colorhcplot")
exprs <- geneData$exprs
fac <- geneData$fac
hc <- hclust(dist(t(exprs)))
colorhcplot(hc, fac, main ="default", col = "gray10")
colorhcplot(hc, fac, main="Control vs. Tumor Samples") 

## ----session Info, fig.align='center', fig.width=7, fig.height=4.5-------
sessionInfo()

