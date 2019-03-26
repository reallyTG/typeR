library(templates)


### Name: tmplUpdate
### Title: Update and evaluate templates
### Aliases: tmplUpdate tmplUpdate.tmpl tmplUpdate.function tmplEval
###   tmplAsFun

### ** Examples

tmpl("This is {{ a }} very similar to {{ b }}", a = "actually", b = "sprintf")
tmpl("But I consider it to be ({{ sprintf('%i', a) }}) orthogonal", a = 1.0)
tmpl("and ({{ sprintf('%i', b) }}) with a different scope:", b = 2.0)
tmpl("SELECT {{ var }} FROM {{ table }} WHERE {{ condition }};",
     var = "someVar", table = "someTable", condition = "primaryKey = 1")
template <- tmpl("cat({{ toupper(x) }})")
tmplUpdate(template, x ~ "hi")
tmplEval(template, x ~ "hi")




