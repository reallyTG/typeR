library(knitr)


### Name: hook_plot_html
### Title: Default plot hooks for different output formats
### Aliases: hook_plot_html hook_plot_asciidoc hook_plot_tex hook_plot_md
###   hook_plot_rst hook_plot_textile

### ** Examples

# this is what happens for a chunk like this

# <<foo-bar-plot, dev='pdf', fig.align='right'>>=
hook_plot_tex("foo-bar-plot.pdf", opts_chunk$merge(list(fig.align = "right")))

# <<bar, dev='tikz'>>=
hook_plot_tex("bar.tikz", opts_chunk$merge(list(dev = "tikz")))

# <<foo, dev='pdf', fig.show='animate', interval=.1>>=

# 5 plots are generated in this chunk
hook_plot_tex("foo5.pdf", opts_chunk$merge(list(fig.show = "animate", interval = 0.1, 
    fig.cur = 5, fig.num = 5)))



