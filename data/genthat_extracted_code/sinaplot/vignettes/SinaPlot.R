## ----example, fig.align='center', fig.width=5, fig.height=4--------------
x <- c(rnorm(200, 4, 1), rnorm(200, 5, 2), rnorm(400, 6, 1.5))
groups <- c(rep("Cond1", 200), rep("Cond2", 200), rep("Cond3", 400))

library(sinaplot)
sinaplot(x, groups)
#Use any "plot" argument
sinaplot(x, groups, col = 2:4, pch = 20, bty = "n")

## ----blood, echo=FALSE, results='asis'-----------------------------------
knitr::kable(head(blood, 10))

## ----bloodDensity, fig.align='center', fig.height=6, fig.width=7---------
sinaplot(Gene ~ Class, data = blood, pch = 20)

## ----bloodScaleOff, fig.align='center', fig.height=6, fig.width=7--------
sinaplot(Gene ~ Class, data = blood, pch = 20, scale = FALSE)

## ----bloodCounts, fig.align='center', fig.height=6, fig.width=7----------
sinaplot(Gene ~ Class, data = blood, pch = 20, scale = FALSE, method = "counts")

## ----bloodParams, fig.align='center', fig.height=6, fig.width=7----------
par(mar = c(9,4,4,2) + 0.1)
n_groups <- length(levels(blood$Class))

sinaplot(Gene ~ Class, data = blood, pch = 20, xaxt = "n", col = rainbow(n_groups), 
         ann = FALSE, bty = "n")
axis(1, at = 1:n_groups, labels = FALSE)
text(x = 1:n_groups,
     y = par()$usr[3] - 0.1 * (par()$usr[4] - par()$usr[3]),
     labels = levels(blood$Class), srt = 45, xpd = TRUE, adj = 1,
     cex = .8)

## ----sessionInfo---------------------------------------------------------
sessionInfo()

