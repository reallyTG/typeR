library(xpose)


### Name: get_data
### Title: Access model output table data
### Aliases: get_data

### ** Examples

# By table name
sdtab <- get_data(xpdb_ex_pk, 'sdtab001')
sdtab

# By problem
tables <- get_data(xpdb_ex_pk, .problem = 1)
tables

# Tip to list available tables in the xpdb
print(xpdb_ex_pk)




