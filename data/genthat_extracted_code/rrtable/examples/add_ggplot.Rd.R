library(rrtable)


### Name: add_ggplot
### Title: Add ggplot into a document object
### Aliases: add_ggplot

### ** Examples

require(rrtable)
require(ggplot2)
require(officer)
require(magrittr)
code <- "ggplot(mtcars, aes(x = mpg , y = wt)) + geom_point()"
read_pptx() %>% add_text(title="ggplot") %>% add_ggplot(code=code)



