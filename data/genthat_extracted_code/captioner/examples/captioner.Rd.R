library(captioner)


### Name: captioner
### Title: Captioner function
### Aliases: captioner

### ** Examples

fig_nums <- captioner()
fig_nums("flower_plot", "This plot shows the distribution of flower colors")
fig_nums("flower_plot", display = "cite")
fig_nums("flower_plot")

tables <- captioner(prefix = "Table", levels = 2)
tables("a", "Table of world populations sorted from greatest to least.")



