## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(warning=FALSE, message=FALSE, cache=FALSE, 
               comment=NA, verbose=TRUE, fig.width=7.5, fig.height=5, dev='jpeg',dev.args=list(quality=50))	
library(imager)
res <- vector("list",3)
a <- imfill(300, 300, 3, c(1,0,0)) %>% grayscale()
res[[1]] <- unique(a)
a <- imfill(300, 300, 3, c(0,1,0)) %>% grayscale()
res[[2]] <- unique(a)
a <- imfill(300, 300, 3, c(0,0,1)) %>% grayscale()
res[[3]] <- unique(a)			   

## ---- message = FALSE----------------------------------------------------
library(imagerExtra)
x <- boats
s <- 0.1
R(x) <- BalanceSimplest(R(x), s, s, range=c(0,1))
G(x) <- BalanceSimplest(G(x), s, s, range=c(0,1))
B(x) <- BalanceSimplest(B(x), s, s, range=c(0,1))
layout(matrix(1:2, 1, 2))
plot(boats, main = "Original")
plot(x, main = "Independently Processed")

## ---- echo = FALSE, size = "huge"----------------------------------------
text1 <- sprintf("Y = %fR + %fG + %fB", res[[1]], res[[2]], res[[3]])
cat(text1)

## ------------------------------------------------------------------------
g <- Grayscale(boats)
hueim <- GetHue(boats)
g <- BalanceSimplest(g, s, s, range=c(0,1))
y <- RestoreHue(g, hueim)
layout(matrix(1:2, 1, 2))
plot(boats, main = "Original")
plot(y, main = "Processed While Preserving Hue")

