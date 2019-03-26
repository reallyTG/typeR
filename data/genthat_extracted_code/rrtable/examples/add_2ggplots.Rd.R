library(rrtable)


### Name: add_2ggplots
### Title: Add two ggplots into a document object
### Aliases: add_2ggplots

### ** Examples

require(ggplot2)
require(magrittr)
require(officer)
require(rvg)
plot1 <- "ggplot(data = iris, aes(Sepal.Length, Petal.Length)) + geom_point()"
plot2 <- "ggplot(data = iris, aes(Sepal.Length, Petal.Length, color = Species)) + geom_point()"
read_pptx() %>% add_text(title="Two ggplots") %>% add_2ggplots(plot1=plot1,plot2=plot2)



