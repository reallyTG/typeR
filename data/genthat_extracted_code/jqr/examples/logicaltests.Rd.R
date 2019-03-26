library(jqr)


### Name: logicaltests
### Title: Logical tests
### Aliases: logicaltests allj anyj

### ** Examples

# any
'[true, false]' %>% anyj
'[false, false]' %>% anyj
'[]' %>% anyj

# all
'[true, false]' %>% allj
'[true, true]' %>% allj
'[]' %>% allj

## many JSON inputs
'[true, false] [true, true] [false, false]' %>% anyj
'[true, false] [true, true] [false, false]' %>% allj



