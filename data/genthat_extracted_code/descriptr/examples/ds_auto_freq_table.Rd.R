library(descriptr)


### Name: ds_auto_freq_table
### Title: Multiple One & Two Way Tables
### Aliases: ds_auto_freq_table ds_auto_cross_table ds_tway_tables
###   ds_oway_tables

### ** Examples

# multiple one way tables
ds_auto_freq_table(mtcarz)
ds_auto_freq_table(mtcarz, cyl, gear)

# multiple two way tables
ds_auto_cross_table(mtcarz)
ds_auto_cross_table(mtcarz, cyl, gear, am)



