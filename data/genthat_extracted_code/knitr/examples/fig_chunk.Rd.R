library(knitr)


### Name: fig_chunk
### Title: Obtain the figure filenames for a chunk
### Aliases: fig_chunk

### ** Examples

library(knitr)
fig_chunk("foo", "png")
fig_chunk("foo", "pdf")
fig_chunk("foo", "svg", 2)  # the second plot of the chunk foo
fig_chunk("foo", "png", 1:5)  # if the chunk foo produced 5 plots



