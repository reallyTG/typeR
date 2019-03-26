library(seplyr)


### Name: gather_se
### Title: Distribute columns into blocks of rows.
### Aliases: gather_se

### ** Examples


d <- wrapr::build_frame(
    'id', 'measurement1', 'measurement2' |
    1   , 'a'           , 10             |
    2   , 'b'           , 20             )
gather_se(d,
  key = "value_came_from_column",
  value = "value_was",
  columns = c("measurement1", "measurement2"))




