library(dplyr)


### Name: arrange
### Title: Arrange rows by variables
### Aliases: arrange arrange.grouped_df

### ** Examples

arrange(mtcars, cyl, disp)
arrange(mtcars, desc(disp))

# grouped arrange ignores groups
by_cyl <- mtcars %>% group_by(cyl)
by_cyl %>% arrange(desc(wt))
# Unless you specifically ask:
by_cyl %>% arrange(desc(wt), .by_group = TRUE)



