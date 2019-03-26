library(rrtable)


### Name: add_Rcode
### Title: Make a R code slide into a document object
### Aliases: add_Rcode

### ** Examples

library(rrtable)
library(magrittr)
library(officer)
code="summary(lm(mpg~hp+wt,data=mtcars))"
read_pptx() %>% add_text(title="Regression Analysis") %>%
   add_Rcode(code) %>% print(target=paste0(tempdir(),"/","test.pptx"))



