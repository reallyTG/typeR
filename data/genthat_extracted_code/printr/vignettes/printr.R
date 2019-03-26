## ----setup--------------------------------------------------------------------
options(width = 80)

## ----comment='', prompt=TRUE--------------------------------------------------
# R uses plain text representation for data frames/matrices/...
head(mtcars)
head(iris)

## -----------------------------------------------------------------------------
library(printr)

## ----warning=FALSE------------------------------------------------------------
options(digits = 4)
set.seed(123)
x = matrix(rnorm(40), 5)
x
# with colunm names
dimnames(x) = list(NULL, head(LETTERS, ncol(x)))
x
# further customization via kable(), e.g. digits and captions
knitr::kable(x, digits = 2, caption = 'A table produced by printr.')
head(mtcars)
head(iris, 10)

## -----------------------------------------------------------------------------
x1 = sample(letters[1:3], 1000, TRUE)
x2 = sample(letters[1:3], 1000, TRUE)
x3 = sample(letters[1:3], 1000, TRUE)
table(x1)
table(x1, x2)
table(x1, x2, x3)

## ----tidy=FALSE---------------------------------------------------------------
??sunflower
help.search('contourplot')
help.search('foo', package = 'base')
help.search('foooooooo', package = 'utils')

## ----tidy=FALSE, comment=''---------------------------------------------------
?coef

## ----tidy=FALSE, printr.help.sections=c('description', 'usage'), comment=''----
?paste

## ----comment='', R.options=list(width=100)--------------------------------------------------------
library(help = 'printr')

