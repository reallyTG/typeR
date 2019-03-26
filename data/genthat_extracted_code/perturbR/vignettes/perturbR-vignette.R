## ---- echo = FALSE-------------------------------------------------------
library(perturbR)

## ------------------------------------------------------------------------
fort5_60 <- as.matrix(read.csv("fort5_60.csv", header = F))

## ---- eval = FALSE-------------------------------------------------------
#  perturbR(sym.matrix = fort5_60, plot = TRUE, errbars = TRUE, resolution = 0.01, reps = 100)

## ---- echo=FALSE, fig.cap="Figure 1", out.width = '100%'-----------------
knitr::include_graphics("fig2.png")

## ---- eval = FALSE-------------------------------------------------------
#  fit5_60 <- perturbR(sym.matrix = fort5_60, plot = FALSE)

## ---- echo = FALSE-------------------------------------------------------
fit5_60 <- readRDS("fit5_60.RDS")

## ------------------------------------------------------------------------
fit5_60$vi20mark 

## ------------------------------------------------------------------------
min(which(colMeans(fit5_60$VI)>fit5_60$vi20mark))

## ------------------------------------------------------------------------
fit5_60$percent[36]

## ------------------------------------------------------------------------
fit5_60$ari20mark 
mean(fit5_60$ARI[,which(round(fit5_60$percent, digits = 2) == .20)])

## ------------------------------------------------------------------------
fit5_60$cutoff

## ------------------------------------------------------------------------
fit5_60$modularity[1,1]

## ---- echo=TRUE, eval = FALSE--------------------------------------------
#  hist(fit5_60$modularity[,which(round(fit5_60$percent, digits = 2) ==1.00)], xlim = c(0,1))
#  abline(v = fit5_60$modularity[1,1], col = "red")

## ---- echo=FALSE, fig.cap="Figure 2", out.width = '100%'-----------------
knitr::include_graphics("fig3.png")

