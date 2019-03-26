library(dbplyr)


### Name: copy_to.src_sql
### Title: Copy a local data frame to a DBI backend.
### Aliases: copy_to.src_sql

### ** Examples

library(dplyr)
set.seed(1014)

mtcars$model <- rownames(mtcars)
mtcars2 <- src_memdb() %>%
  copy_to(mtcars, indexes = list("model"), overwrite = TRUE)
mtcars2 %>% filter(model == "Hornet 4 Drive")

cyl8 <- mtcars2 %>% filter(cyl == 8)
cyl8_cached <- copy_to(src_memdb(), cyl8)

# copy_to is called automatically if you set copy = TRUE
# in the join functions
df <- tibble(cyl = c(6, 8))
mtcars2 %>% semi_join(df, copy = TRUE)



