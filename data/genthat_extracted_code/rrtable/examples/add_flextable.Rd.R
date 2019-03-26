library(rrtable)


### Name: add_flextable
### Title: Add a flextable or mytable object into a document object
### Aliases: add_flextable

### ** Examples

require(rrtable)
require(moonBook)
require(officer)
require(magrittr)
ftable=mytable(Dx~.,data=acs)
title="mytable Example"
ft=df2flextable(head(iris))
title2="df2flextable Example"
doc=read_docx()
doc %>% add_text(title=title) %>%
        add_flextable(ftable) %>%
        add_text(title=title2) %>%
        add_flextable(ft) %>%
        print(target=paste0(tempdir(),"/","mytable.docx"))



