library(stringformattr)


### Name: format-string
### Title: Pass variables into strings
### Aliases: format-string %f%

### ** Examples

# order matters when not using a named vector
'the quick {} fox jumped {} the lazy {}' %f% c('brown', 'over', 'dog')

# use a named vector to insert values by referencing them in the string
gen_sql_query <- function(column, table, id){
    query <- "SELECT {col} FROM {tab} WHERE pk = {id}"
    query %f% c(col = column, tab = table, id = id)
}

gen_sql_query('LASTNAME', 'STUDENTS', '12345')

# `%f%` is vectorized
v <- c('{vegetable}', '{animal}', '{mineral}', '{animal} and {mineral}')
v %f% c(vegetable = 'carrot', animal = 'porpoise', mineral = 'salt')

# if the number of replacements is larger than the length of unnamed arguments,
# `%f%` will recycle the arguments (and give a warning)
c('{} {}', '{} {} {}', '{}') %f% c(0, 1)

# > "0 1" "0 1 0" "0"
  



