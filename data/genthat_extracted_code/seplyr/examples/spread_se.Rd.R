library(seplyr)


### Name: spread_se
### Title: Collect values from blocks of rows into columns.
### Aliases: spread_se

### ** Examples


d <- wrapr::build_frame(
    'id', 'name_for_new_column' , 'value_to_take' |
    1   , 'col1'                , 'a'             |
    1   , 'col2'                , '10'            |
    2   , 'col1'                , 'b'             |
    2   , 'col2'                , '20'            )
spread_se(d,
   key = 'name_for_new_column',
   value = 'value_to_take')




