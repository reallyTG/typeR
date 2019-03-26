## ----setup,include=FALSE-------------------------------------------------
library(knitr)
library(stringr)

knitr::opts_chunk$set(fig.height=4, fig.width=6, verbatim=FALSE,
                      cache=FALSE, autodep = TRUE, cache.path='lemon_print-cache/')

# Show chunk verbatim
# Source: http://stackoverflow.com/questions/19908158/show-an-r-markdown-chunk-in-the-final-output
# Set verbatim option as last and it will not be printed. ;)
hook_source_def = knit_hooks$get('source')
knit_hooks$set(source = function(x, options){
  if (!is.null(options$verbatim) && options$verbatim){
    opts = gsub(",\\s*verbatim\\s*=\\s*TRUE\\s*", "", options$params.src)
    bef = sprintf('\n\n    ```{r %s}\n', opts, "\n")
    stringr::str_c(bef, paste(knitr:::indent_block(x, "    "), collapse = '\n'), "\n    ```\n\n")
  } else {
     hook_source_def(x, options)
  }
})


## ------------------------------------------------------------------------
data(USArrests)
head(USArrests)

## ----message=FALSE-------------------------------------------------------
library(lemon)
knit_print.data.frame <- lemon_print

## ----caption="Data frame is now printed using `kable`.",verbatim=TRUE,render=lemon_print----
head(USArrests)

## ----normal_print,render=normal_print,verbatim=TRUE----------------------
head(USArrests)

## ----results='asis',render=normal_print,verbatim=TRUE--------------------
kable(head(USArrests),caption='Normal `kable` usage.')

## ------------------------------------------------------------------------
kable(head(USArrests))

## ----kable.opts=list(caption='Summary tables are printed with some default options.'),verbatim=TRUE----
knit_print.table <- lemon_print
summary(USArrests)

## ----mtcars--------------------------------------------------------------
head(mtcars)
with(mtcars, table(cyl, gear))

## ------------------------------------------------------------------------
library(dplyr)
knit_print.tbl <- lemon_print

## ----dplyr,kable.opts=list(caption='Also works on `dplyr` objects.'),verbatim=TRUE----
mtcars %>% group_by(cyl) %>% summarise(mean(disp))

