## ----setup, echo=FALSE, include=FALSE------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
#

## ---- include=FALSE------------------------------------------------------
devtools::load_all(".")

## ----install, eval=FALSE-------------------------------------------------
#  # install bioconductor
#  ## try http:// if https:// URLs are not supported
#  source("https://bioconductor.org/biocLite.R")
#  biocLite()
#  
#  # install the package
#  biocLite('loose.rock', dependencies = TRUE)
#  
#  # use the package
#  library(loose.rock)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(dplyr)

## ----coding.genes, collapse=TRUE, message=FALSE, warning=FALSE-----------
coding.genes() %>%
  arrange(external_gene_name) %>% {
   slice(., sample(seq(nrow(.)), 15)) 
  } %>%
  knitr::kable()

## ----balanced.sets, results='hold'---------------------------------------
set1 <- c(T,T,T,T,T,T,T,T,F,T,T,T,T,T,T,T,T,T,F,T)
set2 <- !set1
cat('Set1\n', set1, '\n\nSet2\n', set2, '\n\nTraining / Test set using logical indices\n\n')
set.seed(1985)
balanced.train.and.test(set1, set2, train.perc = .9)
#
set1 <- which(set1)
set2 <- which(set2)
cat('##### Same sets but using numeric indices\n\n', 'Set1\n', set1, '\n\nSet2\n', set2, '\n\nTraining / Test set using numeric indices\n')
set.seed(1985)
balanced.train.and.test(set1, set2, train.perc = .9)
#

## ----gen.synth-----------------------------------------------------------
xdata1 <- gen.synth.xdata(10, 5, .2)
xdata2 <- gen.synth.xdata(10, 5, .75)

## ----show.gen.synth, echo=FALSE------------------------------------------
#
cat('Using .2^|i-j| to generate co-variance matrix\n\n')
cat('X generated\n\n')
data.frame(xdata1)
cat('cov(X)\n\n')
data.frame(cov(xdata1))
draw.cov.matrix(xdata1) + ggplot2::ggtitle('X1 Covariance Matrix')
#
cat('Using .75^|i-j| to generate co-variance matrix (plotting correlation)\n\n')
cat('X generated\n\n')
data.frame(xdata2)
cat('cov(X)\n\n')
data.frame(cor(xdata2, method = 'pearson'))
draw.cov.matrix(xdata2, fun = cor, method = 'pearson') + ggplot2::ggtitle('X2 Pearson Correlation Matrix')

## ------------------------------------------------------------------------
base.dir(tempdir())

## ----runcache1-----------------------------------------------------------
a <- run.cache(sum, 1, 2)
b <- run.cache(sum, 1, 2)
all(a == b)

## ----runcache2-----------------------------------------------------------
a <- run.cache(rnorm, 5, seed = 1985)
b <- run.cache(rnorm, 5, seed = 2000)
all(a == b)

## ----proper--------------------------------------------------------------
x <- "OnE oF sUcH iS a proPer function that capitalizes a string."
proper(x)

## ----mycolors------------------------------------------------------------
xdata <- -10:10
plot(xdata, 1/10 * xdata * xdata + 1, type="l", pch = my.symbols(1), col = my.colors(1), cex = .9,
     xlab = '', ylab = '', ylim = c(0, 20))
grid(NULL, NULL, lwd = 2) # grid only in y-direction
for (ix in 2:22) {
  points(xdata, 1/10 * xdata * xdata + ix, pch = my.symbols(ix), col = my.colors(ix), cex = .9)
}

