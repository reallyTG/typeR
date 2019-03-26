# Minimal Pipe
# Use to eliminate dependency on magrittr

`%>%` = function(par, fun) {
  s = substitute(fun)
  fun.name <- ifelse( is.name(s), s, s[[1]] )
  fun.args = as.list(s)
  fun.args[[1]] = par
  do.call(deparse(fun.name), fun.args)
}

qw <- function (...) as.character(match.call())[-1]
