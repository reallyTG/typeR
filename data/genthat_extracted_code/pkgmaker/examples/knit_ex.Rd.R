library(pkgmaker)


### Name: knit_ex
### Title: Knitr Extensions
### Aliases: knit_ex hook_try hook_backspace hook_toggle

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


library(knitr)
knit_ex("1 + 1")


library(knitr)

# standard error message is caught
knit_ex("stop('ah ah')")

# with try the error is output on stderr but not caughted by knitr
knit_ex("try( stop('ah ah') )")

# no message caught
knit_ex("
^^^{r, include = FALSE}
knit_hooks$set(try = pkgmaker::hook_try)
^^^

^^^{r, try=TRUE}
try( stop('ah ah') )
^^^")


# Correctly formatting backspaces in chunk outputs
tmp <- tempfile(fileext = '.Rmd')
cat(file = tmp, "
^^^{r, include = FALSE}
library(knitr)
knit_hooks$set(backspace = pkgmaker::hook_backspace())
^^^
Default knitr does not handle backspace and adds a special character:
^^^{r}
cat('abc\bd')
^^^

Using the hook backspace solves the issue:
^^^{r, backspace=TRUE}
cat('abc\bd')
^^^
")

# knit
out <- knitr::knit2html(tmp, fragment.only = TRUE)
# look at output
## Not run: 
##D   browseURL(out)
##D   edit( file = out)
## End(Not run)
# cleanup
unlink(c(tmp, out))



knit_ex("

Declare chunk hook:
^^^{r, setup}
library(knitr)
knit_hooks$set(toggle = hook_toggle())
^^^

The R code of this chunk can be toggled on/off, and starts visible:
^^^{r, toggle=TRUE}
print(1:10)
^^^
The R code of this chunk can be toggled on/off, and starts hidden:
^^^{r, toggle=FALSE}
print(1:10)
^^^

This is a plain chunk that cannot be toggled on/off:
^^^{r}
print(1:10)
^^^

Now all chunks can be toggled and start visible:
^^^{r, toggle_all}
opts_chunk$set(toggle = TRUE)
^^^

^^^{r}
sample(5)
^^^

To diable the toggle link, one can pass anything except TRUE/FALSE:
^^^{r, toggle = NA}
sample(5)
^^^

", open = TRUE)




