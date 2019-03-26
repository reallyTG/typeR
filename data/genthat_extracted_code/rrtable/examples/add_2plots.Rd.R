library(rrtable)


### Name: add_2plots
### Title: Add two plots into a document object
### Aliases: add_2plots

### ** Examples

require(magrittr)
require(officer)
plotstring1="plot(1:10)"
plotstring2="hist(rnorm(100))"
read_pptx() %>% add_text(title="Two plots") %>% add_2plots(plotstring1,plotstring2) %>%
print(target=paste0(tempdir(),"/","demo.pptx"))



