library(knitr)


### Name: opts_hooks
### Title: Hooks for code chunk options
### Aliases: opts_hooks
### Keywords: datasets

### ** Examples

# make sure the figure width is no smaller than fig.height
opts_hooks$set(fig.width = function(options) {
    if (options$fig.width < options$fig.height) {
        options$fig.width = options$fig.height
    }
    options
})
# remove all hooks
opts_hooks$restore()



