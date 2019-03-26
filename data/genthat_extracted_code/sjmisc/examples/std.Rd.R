library(sjmisc)


### Name: std
### Title: Standardize and center variables
### Aliases: std std_if center center_if

### ** Examples

data(efc)
std(efc$c160age) %>% head()
std(efc, e17age, c160age, append = FALSE) %>% head()

center(efc$c160age) %>% head()
center(efc, e17age, c160age, append = FALSE) %>% head()

# NOTE!
std(efc$e17age) # returns a vector
std(efc, e17age) # returns a data frame

# with quasi-quotation
x <- "e17age"
center(efc, !!x, append = FALSE) %>% head()

# works with mutate()
library(dplyr)
efc %>%
  select(e17age, neg_c_7) %>%
  mutate(age_std = std(e17age), burden = center(neg_c_7)) %>%
  head()

# works also with grouped data frames
mtcars %>% std(disp)

# compare new column "disp_z" w/ output above
mtcars %>%
  group_by(cyl) %>%
  std(disp)

data(iris)
# also standardize factors
std(iris, include.fac = TRUE, append = FALSE)
# don't standardize factors
std(iris, include.fac = FALSE, append = FALSE)

# standardize only variables with more than 10 unique values
p <- function(x) dplyr::n_distinct(x) > 10
std_if(efc, predicate = p, append = FALSE)




