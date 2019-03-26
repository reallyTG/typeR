## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
    collapse = FALSE,
    comment = "#>",
    fig.path = "README-"
)

## ---- message=FALSE, highlight=TRUE--------------------------------------
library(zoocat)

## ------------------------------------------------------------------------
mat <- matrix(round(rnorm(24), 2), ncol = 4)
ctable <- data.frame(treatment = factor(rep(c('a', 'b'), 2), levels = c('a', 'b')), 
                     site = factor(rep(c('s1', 's2'), each = 2), levels = c('s1', 's2')))
zc <- zoocat(mat, order.by = 2011 : 2014, colattr = ctable, index.name = 'year')
print(zc)

## ---- highlight=TRUE-----------------------------------------------------
cattr(zc)
zc2 <- zc
cattr(zc2) <- data.frame(cattr(zc), observer = 'Jack')
print(zc2)

## ---- highlight=TRUE-----------------------------------------------------
zc2 <- zc + 10
cattr(zc2) <- data.frame(site = 's3', added = rep(TRUE, 4))
zc.merge <- cbind(zc, zc2)
print(zc.merge)
cattr(zc.merge)

## ---- highlight=TRUE-----------------------------------------------------
df.melt <- melt(zc)
head(df.melt)

## ---- highlight=TRUE-----------------------------------------------------
cast2zoocat(df.melt, index.var = 'year', value.var = 'value')

## ---- highlight=TRUE-----------------------------------------------------
reset_index_var(zc, index.var = 'treatment')

## ------------------------------------------------------------------------
apply_col(zc, FUN = mean)
apply_col(zc, FUN = function (x) {c(mean = mean(x), sd = sd(x))})

## ------------------------------------------------------------------------
apply_core(zc, FUN = colMeans, bind = 'cattr')
apply_core(zc, FUN = rowMeans, bind = 'index')
apply_core(zc, FUN = function (x) {t(x*2)}, bind = c('cattr', 'index'))

## ------------------------------------------------------------------------
filter_col(zc, cond = treatment == 'a' & site == 's2')

