## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  library(styler)
#  microbenchmark::microbenchmark(
#    base = style_file("tests/testthat/indention_multiple/overall-in.R"),
#    times = 2
#  )
#  #> Unit: seconds
#  #>  expr      min       lq     mean   median       uq      max neval
#  #>  base 4.131253 4.131253 4.172017 4.172017 4.212781 4.212781     2

## ------------------------------------------------------------------------
#  microbenchmark::microbenchmark(
#    base = style_file("tests/testthat/indention_multiple/overall-in.R"),
#    times = 2
#  )
#  #> Unit: seconds
#  #>  expr     min      lq     mean   median       uq      max neval
#  #>  base 2.13616 2.13616 2.223659 2.223659 2.311158 2.311158     2

## ------------------------------------------------------------------------
#  microbenchmark::microbenchmark(
#    base = style_file("tests/testthat/indention_multiple/overall-in.R"),
#    times = 5
#  )
#  
#  #> Unit: seconds
#  #>  expr     min       lq     mean   median       uq      max neval
#  #>  base 2.18097 2.184721 2.225294 2.200893 2.241799 2.318089     5

## ------------------------------------------------------------------------
#  microbenchmark::microbenchmark(
#    base = style_file("tests/testthat/indention_multiple/overall-in.R"),
#    times = 5
#  )
#  #> Unit: seconds
#  #>  expr      min       lq     mean   median       uq      max neval
#  #>  base 2.109271 2.134377 2.147821 2.158567 2.165384 2.171505     5

## ------------------------------------------------------------------------
#  microbenchmark::microbenchmark(
#    base = style_file("tests/testthat/indention_multiple/overall-in.R"),
#    times = 5
#  )
#  #> Unit: milliseconds
#  #>  expr      min       lq     mean   median       uq      max neval
#  #>  base 930.4391 944.9253 969.2838 951.4632 951.6571 1067.934     5

## ------------------------------------------------------------------------
#  microbenchmark::microbenchmark(
#    base = style_file("tests/testthat/indention_multiple/overall-in.R"),
#    times = 10
#  )
#  #> Unit: seconds
#  #> expr      min       lq     mean   median       uq      max neval
#  #>  base 1.235749 1.259139 1.269869 1.269396 1.275887 1.330341    10
#  

## ------------------------------------------------------------------------
#  microbenchmark::microbenchmark(
#    base = style_file("tests/testthat/indention_multiple/overall-in.R"),
#    times = 10
#  )
#  #> Unit: milliseconds
#  #>  expr      min       lq     mean   median       uq      max neval
#  #>  base 514.9392 520.5061 587.6329 530.3154 548.7248 989.3332    10
#  

