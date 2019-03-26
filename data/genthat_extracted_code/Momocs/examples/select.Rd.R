library(Momocs)


### Name: select
### Title: Select and rename columns by name
### Aliases: select

### ** Examples

olea
select(olea, var, view) # drops domes and ind
select(olea, variety=var, domesticated_status=domes, view)
# combine with filter with magrittr pipes
# only dorsal views, and 'var' and 'domes' columns
filter(olea, view=="VD") %>% select(var, domes)
head(olea$fac)
# select some columns
select(olea, domes, view)
# remove some columns
select(olea, -ind)
# rename on the fly and select some columns
select(olea, foo=domes)




