library(sjmisc)


### Name: dicho
### Title: Dichotomize variables
### Aliases: dicho dicho_if

### ** Examples

data(efc)
summary(efc$c12hour)
# split at median
table(dicho(efc$c12hour))
# split at mean
table(dicho(efc$c12hour, dich.by = "mean"))
# split between value lowest to 30, and above 30
table(dicho(efc$c12hour, dich.by = 30))

# sample data frame, values from 1-4
head(efc[, 6:10])

# dichtomized values (1 to 2 = 0, 3 to 4 = 1)
library(dplyr)
efc %>%
  select(6:10) %>%
  dicho(dich.by = 2) %>%
  head()

# dichtomize several variables in a data frame
dicho(efc, c12hour, e17age, c160age, append = FALSE)

# dichotomize and set labels
frq(dicho(
  efc, e42dep,
  var.label = "Dependency (dichotomized)",
  val.labels = c("lower", "higher"),
  append = FALSE
))

# works also with gouped data frames
mtcars %>%
  dicho(disp, append = FALSE) %>%
  table()

mtcars %>%
  group_by(cyl) %>%
  dicho(disp, append = FALSE) %>%
  table()

# dichotomizing grouped data frames leads to different
# results for a dichotomized variable, because the split
# value is different for each group.
# compare:
mtcars %>%
  group_by(cyl) %>%
  summarise(median = median(disp))

median(mtcars$disp)

# dichotomize only variables with more than 10 unique values
p <- function(x) dplyr::n_distinct(x) > 10
dicho_if(efc, predicate = p, append = FALSE)




