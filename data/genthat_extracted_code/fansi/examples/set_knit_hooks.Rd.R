library(fansi)


### Name: set_knit_hooks
### Title: Set an Output Hook to Display ANSI CSI SGR in Rmarkdown
### Aliases: set_knit_hooks

### ** Examples

## Not run: 
##D ## The following should be done within an `rmarkdown` document chunk with
##D ## chunk option `results` set to 'asis' and the chunk option `comment` set
##D ## to ''.
##D 
##D ```{r comment="", results='asis', echo=FALSE}
##D ## Change the "output" hook to handle ANSI CSI SGR
##D 
##D old.hooks <- set_knit_hooks(knitr::knit_hooks)
##D 
##D ## Do the same with the warning, error, and message, and add styles for
##D ## them (alternatively we could have done output as part of this call too)
##D 
##D styles <- c(
##D   getOption('fansi.style'),  # default style
##D   "PRE.fansi CODE {background-color: transparent;}",
##D   "PRE.fansi-error {background-color: #DD5555;}",
##D   "PRE.fansi-warning {background-color: #DDDD55;}",
##D   "PRE.fansi-message {background-color: #EEEEEE;}"
##D )
##D old.hooks <- c(
##D   old.hooks,
##D   fansi::set_knit_hooks(
##D     knitr::knit_hooks,
##D     which=c('warning', 'error', 'message'),
##D     style=styles
##D ) )
##D ```
##D ## You may restore old hooks with the following chunk
##D 
##D ## Restore Hooks
##D ```{r}
##D do.call(knitr::knit_hooks$set, old.hooks)
##D ```
## End(Not run)



