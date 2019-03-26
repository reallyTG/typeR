## ------------------------------------------------------------------------
library(eply)

## ------------------------------------------------------------------------
.fun = example.fun
.fun

## ------------------------------------------------------------------------
.expr = example.expr()
.expr
# str(.expr) # The expressions are actually just characters.

## ------------------------------------------------------------------------
a = 1
b = 2

## ------------------------------------------------------------------------
eply(.fun, .expr)

## ------------------------------------------------------------------------
evals(c("1+1", "2+2", "3+3"))
evals(c("1+1", "2+2", "3+3"), .simplify = FALSE)
a = 4
evals(c("subset(mtcars, cyl == a, mpg, TRUE)", "mtcars[1:2, 1:2]"))

## ------------------------------------------------------------------------
.fun = function(x) return(x)
.expr = data.frame(x = c("1+a", "1+b"))
rownames(.expr) = c("expr1", "expr2")
a = b = 0
.with = list(a = 1, b = 2)
eply(.fun, .expr, .with)
evals(.expr$x, .with)

## ------------------------------------------------------------------------
.expr2 = split(.expr, f = .expr$x) # list of rows of .expr
lapply(.expr2, eply, .fun = .fun, .with = .with)
lapply(c("1+X", "2+Y"), evals, .with = list(X = 1, Y = 2))

## ---- eval = F-----------------------------------------------------------
#  library(parallel)
#  .fun = example.fun
#  expr.dataframe = example.expr()
#  expr.list = split(expr.dataframe, f = expr.dataframe$rep) # split expr.dataframe by rep
#  .with = example.with()
#  mclapply(X = expr.list, FUN = eply, .fun = .fun, .with = .with, mc.cores = 2)

## ------------------------------------------------------------------------
.expr = data.frame(
  string = quotes(c("a", "b")),
  variable = c("c", "d"))
.expr
.fun = function(string, variable) paste(string, variable)
.with = list(c = "C", d = "D")
eply(.fun, .expr, .with)

## ------------------------------------------------------------------------
quotes(c("x", "y"))
quotes(c("x", "y"), single = FALSE)
quotes(c("x", "y"), single = TRUE)

## ------------------------------------------------------------------------
.expr$string = unquote(.expr$string)
.expr
x = quotes(quotes(c("x", "y"), single = TRUE))
x
unquote(x, deep = TRUE)
unquote(x, deep = FALSE)

## ------------------------------------------------------------------------
data.frame(
  arg1 = strings(a + b, sqrt(x) - 2), 
  arg2 = 1:2)

## ------------------------------------------------------------------------
help_eply()

