## ------------------------------------------------------------------------
library(grapes)
grow(rbind, c, from = "base") # Use `from` to specify a package or environment to search.
bunch()
nrow(sleep) 
longer = sleep %rbind% sleep %rbind% sleep
nrow(longer)
1 %rbind% 2 %c% 3

## ------------------------------------------------------------------------
myop <- function(x, y){
  1/x + 1/y
}
grow(myop)
2 %myop% 3

## ------------------------------------------------------------------------
bunch()
functions()

## ------------------------------------------------------------------------
2 %myop% 3 %myop% 4
(2 %myop% 3) %myop% 4
2 %myop% (3 %myop% 4)

## ------------------------------------------------------------------------
functions("knitr")
bunch("knitr")
grow(from = "knitr")
bunch()
`%purl%`

## ------------------------------------------------------------------------
to_env = new.env()
from_env = new.env()
from_env$nextop = function(a, b, extra = 3){
  sqrt(a^2 + b^2) + extra
}
assign_operator = function(){
  grow(nextop, from = from_env, to = to_env)
}
assign_operator()
# 1 %nextop% 2 # throws an error since %nextop% is not defined in your workspace
eval(parse(text = "1 %nextop% 2"), envir = to_env)
bunch(from_env)
functions(from_env)
bunch(to_env)
functions(to_env)

