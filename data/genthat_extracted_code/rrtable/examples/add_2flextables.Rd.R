library(rrtable)


### Name: add_2flextables
### Title: Add two flextables into a document object
### Aliases: add_2flextables

### ** Examples

require(rrtable)
require(officer)
require(magrittr)
title="Two Tables"
ft1=df2flextable(head(iris[1:4]))
ft2=df2flextable(tail(iris[1:4]))
doc=read_docx()
doc %>% add_text(title=title) %>%
        add_2flextables(ft1,ft2) %>%
        print(target=paste0(tempdir(),"/","2tables.docx"))



