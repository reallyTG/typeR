library(crosswalkr)


### Name: renamefrom
### Title: Rename data frame columns using external crosswalk file.
### Aliases: renamefrom renamefrom_

### ** Examples

df <- data.frame(state = c('Kentucky','Tennessee','Virginia'),
                 fips = c(21,47,51),
                 region = c('South','South','South'))

cw <- data.frame(old_name = c('state','fips'),
                 new_name = c('stname','stfips'),
                 label = c('Full state name', 'FIPS code'))

df1 <- renamefrom(df, cw, old_name, new_name, label)
df2 <- renamefrom(df, cw, old_name, new_name, name_label = TRUE)
df3 <- renamefrom(df, cw, old_name, new_name, drop_extra = FALSE)




