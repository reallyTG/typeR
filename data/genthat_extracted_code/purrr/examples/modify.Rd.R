library(purrr)


### Name: modify
### Title: Modify elements selectively
### Aliases: modify modify.default modify_if modify_if.default modify_at
###   modify_at.default modify2 imodify modify_depth modify_depth.default

### ** Examples

# Convert factors to characters
iris %>%
  modify_if(is.factor, as.character) %>%
  str()

# Specify which columns to map with a numeric vector of positions:
mtcars %>% modify_at(c(1, 4, 5), as.character) %>% str()

# Or with a vector of names:
mtcars %>% modify_at(c("cyl", "am"), as.character) %>% str()

list(x = rbernoulli(100), y = 1:100) %>%
  transpose() %>%
  modify_if("x", ~ update_list(., y = ~ y * 100)) %>%
  transpose() %>%
  simplify_all()

# Use modify2() to map over two vectors and preserve the type of
# the first one:
x <- c(foo = 1L, bar = 2L)
y <- c(TRUE, FALSE)
modify2(x, y, ~ if (.y) .x else 0L)

# Use a predicate function to decide whether to map a function:
modify_if(iris, is.factor, as.character)

# Specify an alternative with the `.else` argument:
modify_if(iris, is.factor, as.character, .else = as.integer)


# Modify at specified depth ---------------------------
l1 <- list(
  obj1 = list(
    prop1 = list(param1 = 1:2, param2 = 3:4),
    prop2 = list(param1 = 5:6, param2 = 7:8)
  ),
  obj2 = list(
    prop1 = list(param1 = 9:10, param2 = 11:12),
    prop2 = list(param1 = 12:14, param2 = 15:17)
  )
)

# In the above list, "obj" is level 1, "prop" is level 2 and "param"
# is level 3. To apply sum() on all params, we map it at depth 3:
l1 %>% modify_depth(3, sum) %>% str()

# Note that vectorised operations will yield the same result when
# applied at the list level as when applied at the atomic result.
# The former is more efficient because it takes advantage of
# vectorisation.
l1 %>% modify_depth(3, `+`, 100L)
l1 %>% modify_depth(4, `+`, 100L)

# modify() lets us pluck the elements prop1/param2 in obj1 and obj2:
l1 %>% modify(c("prop1", "param2")) %>% str()

# But what if we want to pluck all param2 elements? Then we need to
# act at a lower level:
l1 %>% modify_depth(2, "param2") %>% str()

# modify_depth() can be with other purrr functions to make them operate at
# a lower level. Here we ask pmap() to map paste() simultaneously over all
# elements of the objects at the second level. paste() is effectively
# mapped at level 3.
l1 %>% modify_depth(2, ~ pmap(., paste, sep = " / ")) %>% str()



