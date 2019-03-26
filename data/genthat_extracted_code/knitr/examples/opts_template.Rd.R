library(knitr)


### Name: opts_template
### Title: Template for creating reusable chunk options
### Aliases: opts_template
### Keywords: datasets

### ** Examples

opts_template$set(myfigures = list(fig.height = 4, fig.width = 4))
# later you can reuse these chunk options by 'opts.label', e.g.

# <<foo, opts.label='myfigures'>>=

# the above is equivalent to <<foo, fig.height=4, fig.width=4>>=



