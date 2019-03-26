library(rrtable)


### Name: add_img
### Title: Add plot into a document object
### Aliases: add_img

### ** Examples

require(officer)
require(rrtable)
require(magrittr)
require(flextable)
read_pptx() %>% add_text(title="Add image") %>% add_img("plot(mtcars)",format="png",res=300)



