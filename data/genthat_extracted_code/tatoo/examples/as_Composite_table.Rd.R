library(tatoo)


### Name: as_Composite_table
### Title: Coerce to Composite Table
### Aliases: as_Composite_table as_Composite_table.Mashed_table
###   as_Composite_table.data.frame is_Composite_table

### ** Examples


mash_table(
  head = head(cars),
  tail = tail(cars),
  mash_method = 'col'
)


as_Composite_table(data.frame(
  apple.fruit = 1,
  kiwi.fruit = 2,
  dog.animal = 1,
  black.cat.animal = 2,
  parrot.animal = 3
))




