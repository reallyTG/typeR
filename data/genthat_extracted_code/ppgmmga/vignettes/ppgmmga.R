## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(fig.align = "center", 
               out.width = "90%",
               fig.width = 6, fig.height = 5.5,
               dev.args=list(pointsize=10),
               par = TRUE, # needed for setting hook 
               collapse = TRUE, # collapse input & ouput code in chunks
               warning = FALSE)

knit_hooks$set(par = function(before, options, envir)
  { if(before && options$fig.show != "none") 
       par(family = "sans", mar=c(4.1,4.1,1.1,1.1), mgp=c(3,1,0), tcl=-0.5)
})

## ---- message = FALSE, echo=1--------------------------------------------
library(ppgmmga)
cat(ppgmmga:::ppgmmgaStartupMessage(), sep="")

## ------------------------------------------------------------------------
library(mclust)
data("banknote")
X <- banknote[,-1]
Class <- banknote$Status
table(Class)
clPairs(X, classification = Class)

## ------------------------------------------------------------------------
pp1D <- ppgmmga(data = X, d = 1, approx = "UT", seed = 1)
pp1D
summary(pp1D)
plot(pp1D)
plot(pp1D, class = Class)

## ------------------------------------------------------------------------
pp2D <- ppgmmga(data = X, d = 2, approx = "UT", seed = 1)
summary(pp2D, check = TRUE)
summary(pp2D$GMM)
plot(pp2D$GA)
plot(pp2D)
plot(pp2D, class = Class, drawAxis = FALSE)

## ------------------------------------------------------------------------
gmm <- densityMclust(data = scale(X, center = TRUE, scale = FALSE), G = 2)
pp3D <- ppgmmga(data = X, d = 3, 
                center = TRUE, scale = FALSE, gmm = gmm, 
                gatype = "gaisl", 
                options = ppgmmga.options(numIslands = 2),
                seed = 1)
summary(pp3D$GA)
plot(pp3D$GA)
plot(pp3D)
plot(pp3D, class = Class)
plot(pp3D, dim = c(1,2))
plot(pp3D, dim = c(1,3), class = Class)

