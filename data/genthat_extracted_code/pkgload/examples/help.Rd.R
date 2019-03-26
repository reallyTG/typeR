library(pkgload)


### Name: help
### Title: Drop-in replacements for help and ? functions
### Aliases: help shim_help ? shim_question

### ** Examples

## Not run: 
##D # This would load devtools and look at the help for load_all, if currently
##D # in the devtools source directory.
##D load_all()
##D ?load_all
##D help("load_all")
## End(Not run)

# To see the help pages for utils::help and utils::`?`:
help("help", "utils")
help("?", "utils")

## Not run: 
##D # Examples demonstrating the multiple ways of supplying arguments
##D # NB: you can't do pkg <- "ggplot2"; help("ggplot2", pkg)
##D help(lm)
##D help(lm, stats)
##D help(lm, 'stats')
##D help('lm')
##D help('lm', stats)
##D help('lm', 'stats')
##D help(package = stats)
##D help(package = 'stats')
##D topic <- "lm"
##D help(topic)
##D help(topic, stats)
##D help(topic, 'stats')
## End(Not run)



