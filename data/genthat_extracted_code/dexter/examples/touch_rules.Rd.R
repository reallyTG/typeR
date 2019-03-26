library(dexter)


### Name: touch_rules
### Title: Add or modify scoring rules
### Aliases: touch_rules

### ** Examples

## No test: 
# given that in your dexter project there is an mc item with id 'itm_01', 
# which currently has key 'A' but you want to change it to 'C'.

new_rules = data.frame(item_id='itm_01', response=c('A','C'), item_score=c(0,1))
touch_rules(db, new_rules)
## End(No test)




