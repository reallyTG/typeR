## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, comment = "")
knitr::knit_engines$set(list(
  styler = function(options) {
    options$comment <- ""
    knitr::engine_output(
      options,
      
      c("# Before", options$code),
      c("# After", styler::style_text(options$code))
    )
  }
))


## ------------------------------------------------------------------------
library("styler")
library("magrittr")
style_text("a=3; 2", scope = "spaces")

## ------------------------------------------------------------------------
style_text("a=3; 2", scope = "tokens")

## ------------------------------------------------------------------------
style_text("if(x) {66 } else {a=3}", scope = "line_breaks")

## ------------------------------------------------------------------------
code <- c(
    "a <- function() { ", 
    "                a=3", 
    "}"
)

style_text(code, scope = "spaces")

## ------------------------------------------------------------------------
style_text(code, scope = "indention")

## ------------------------------------------------------------------------
style_text(
  "data_frame(
     small  = 2 ,
     medium = 4,#comment without space
     large  = 6
   )", strict = FALSE
)

## ------------------------------------------------------------------------
style_text(
  "a <-   'one'   #just one
   abc <- 'three' # three", 
  strict = FALSE
)

## ------------------------------------------------------------------------
style_text(
  "1++1/2*2^2", 
  math_token_spacing = specify_math_token_spacing(zero = c("'/'", "'*'", "'^'"))
)

## ------------------------------------------------------------------------
style_text(
  c(
    "a <- function() {",
    "### not to be indented",
    "# indent normally",
    "33",
    "}"
  ),
  reindention = specify_reindention(regex_pattern = "###", indention = 0)
  
)

