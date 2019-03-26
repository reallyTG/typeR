library(rrtable)


### Name: add_plot
### Title: Add plot into a document object
### Aliases: add_plot

### ** Examples

require(rrtable)
require(officer)
require(rvg)
require(magrittr)
read_pptx() %>% add_text(title="Plot") %>% add_plot("plot(iris)")



