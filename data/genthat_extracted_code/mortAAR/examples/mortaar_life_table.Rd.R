library(mortAAR)


### Name: mortaar_life_table
### Title: *mortaar_life_table* and *mortaar_life_table_list*
### Aliases: mortaar_life_table as.mortaar_life_table_list
###   as.mortaar_life_table

### ** Examples

# a mortaar_life_table can be put together manually:
as.mortaar_life_table(data.frame(a = c(20, 20, 20), Dx = c(10, 15, 20)))

as.mortaar_life_table_list(
  list(
    life.table(schleswig_ma[c("a", "Dx")]),
    life.table(schleswig_ma[c("a", "Dx")])
  )
)




