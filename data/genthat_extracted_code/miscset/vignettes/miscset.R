## ----eval=FALSE----------------------------------------------------------
#  install.packages('miscset')

## ----eval=FALSE----------------------------------------------------------
#  install.packages('devtools')
#  devtools::install_github('setempler/miscset@develop', build_vignettes = TRUE)

## ------------------------------------------------------------------------
library(miscset)

## ----fig.height=3, fig.width=4, fig.align='center'-----------------------
d <- data.frame(a=c(2,1,3,NA,1), b=2:6, c=5:1)
ciplot(d)

## ----fig.height=2, fig.width=6, fig.align='center'-----------------------
library(ggplot2)
plots <- list(
  ggplot(d, aes(x = b, y= -c, col = b)) + geom_line(),
  ggplot(d, aes(x = b, y = -c, shape = factor(b))) + geom_point())
ggplotGrid(plots, ncol = 2)

## ----comment=NA, fig.height=3, fig.width=4, fig.align='center'-----------
d <- data.frame(a=c(2,1,3,NA,1), b=2:6, c=5:1)
n <- length(d)
gghcl(n)
ciplot(d, col = gghcl(n))

## ----fig.height=2, fig.width=2, fig.align='center'-----------------------
plotn()

## ---- comment=NA---------------------------------------------------------
d <- data.frame(a=c(2,1,3,NA,1), b=2:6, c=5:1)
print(d)
sort(d, by = c("a", "c"))

## ----comment=NA----------------------------------------------------------
d <- data.frame(a=c(2,1,3,NA,1), b=2:6, c=5:1)
print(d[1:3,])
do.rbind(list(first=d[1:2,], second=d[1:3,]))

## ----comment=NA----------------------------------------------------------
m <- matrix(letters[1:9], 3, 3, dimnames = list(1:3,1:3))
print(m)
enpaire(m)

## ----comment=NA----------------------------------------------------------
m <- matrix(letters[1:9], 3, 3, dimnames = list(1:3,1:3))
print(m[-1,])
squarematrix(m[-1,])

## ----comment=NA----------------------------------------------------------
d <- data.frame(a=c(2,1,3,NA,1), b=2:6, c=5:1)
textable(d, caption = 'miscset vignette example data.frame', as.document = TRUE)

## ----comment=NA----------------------------------------------------------
lsall()

## ----comment=NA----------------------------------------------------------
s <- c("ab","ac","bc", NA)
mgrepl(c("a","b"), s)
mgrepl(c("a","b"), s, any) # similar to: grepl("a|b", s)
mgrepl(c("a", "b"), s, sum)
mgrepl(c("a","b"), s, identity)

## ----comment=NA----------------------------------------------------------
gregexprind(c("a"), c("ababa","ab","xyz",NA), 1)
gregexprind(c("a"), c("ababa","ab","xyz",NA), 2)
gregexprind(c("a"), c("ababa","ab","xyz",NA), "last")

## ----comment=NA----------------------------------------------------------
paste(letters, collapse = "")
collapse(letters)

## ----comment=NA----------------------------------------------------------
# create example data
set.seed(12)
s <- s2 <- sample(LETTERS[1:4], 9, replace = TRUE)
s2[1:2] <- rev(s2[1:2])
d <- data.frame(group = rep(letters[c(3,1,2)], each = 3), 
                value = s,
                level = factor(s2),
                stringsAsFactors = FALSE)
print(d)

## ----comment=NA----------------------------------------------------------
collapse(d)

## ----comment=NA----------------------------------------------------------
collapse(d, by = NULL)

## ----comment=NA----------------------------------------------------------
collapse(d, "/", 1)

## ----comment=NA----------------------------------------------------------
# by first column, but keep values as vectors
collapse(d, NULL, c(1,3), .sortby = T)

## ----comment=NA----------------------------------------------------------
leading0(c(9, 112, 5009))

## ----comment=NA----------------------------------------------------------
s <- "xa,xb,xn,ya,yb"
strextr(s, "n$", ",")
strextr(s, "^x", ",", mult=T)
library(stringr)
str_extract(s, "[^,]*n")
str_extract_all(s, "x[^,]*")

## ----comment=NA----------------------------------------------------------
s <- "xa,xb,xn,ya,yb"
str_part(s, ",", 3)

## ----comment=NA----------------------------------------------------------
str_rev(c("olleH", "!dlroW"))

## ----comment=NA----------------------------------------------------------
data.frame(
  duplicate = d$a,
  ".d" = duplicated(d$a), # standard R function
  ".s" = duplicates(d$a),
  ".i" = duplicatei(d$a))

## ----comment=NA----------------------------------------------------------
p2star(c(0.003, 0.049, 0.092, 0.431))

## ----comment=NA----------------------------------------------------------
n <- c(2,1,3,NA,1)
confint(n, ret.attr = FALSE)

## ----comment=NA----------------------------------------------------------
ntri(12)

## ----comment=NA----------------------------------------------------------
n <- 5:1
scale0(n)
scaler(n, c(2, 6), b = c(1, 10))

## ----comment=NA----------------------------------------------------------
n <- c(2,1,3,NA,1)
nunique(n)
nunique(n, FALSE)
uniquei(n)
uniquei(n, FALSE)

