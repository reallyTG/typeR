## ---- echo=FALSE, warning=FALSE, cache=FALSE, results='hide', message=FALSE----
library(magrittr)
# library(sticky)

## ---- echo=FALSE, warning=FALSE, message=FALSE---------------------------
   library(sticky)

## ---- results='hide'-----------------------------------------------------
x <- 1:5
attr(x, 'foo') <- 'bar'
attr(x[1:3],'foo')        # NULL -- attribute was lost by the subset

## ---- results='hide'-----------------------------------------------------
x <- sticky(x)
attr(x[1:3],'foo')        # 'bar' -- attribute preserved during subset

## ---- results='hide'-----------------------------------------------------
    df <- data.frame( 
      sticky   = sticky( structure(1:5, foo="bar") ),
      nonstick = structure( letters[1:5], foo="bar" )
    )
    attr( df[2:3,"nonstick"], 'foo' )  # NULL
    attr( df[2:3,"sticky"], 'foo' )    # bar

