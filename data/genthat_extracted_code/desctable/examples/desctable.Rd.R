library(desctable)


### Name: desctable
### Title: Generate a statistics table
### Aliases: desctable desctable.default desctable.grouped_df

### ** Examples

iris %>%
  desctable

# Does the same as stats_auto here
iris %>% 
  desctable(stats = list("N"      = length,
                         "%/Mean" = is.factor ~ percent | (is.normal ~ mean),
                         "sd"     = is.normal ~ sd,
                         "Med"    = is.normal ~ NA | median,
                         "IQR"    = is.normal ~ NA | IQR))

# With labels
mtcars %>% desctable(labels = c(hp  = "Horse Power",
                                cyl = "Cylinders",
                                mpg = "Miles per gallon"))

# With grouping on a factor
iris %>%
  group_by(Species) %>%
  desctable(stats = stats_default)

# With nested grouping, on arbitrary variables
mtcars %>%
  group_by(vs, cyl) %>%
  desctable

# With grouping on a condition, and choice of tests
iris %>%
  group_by(Petal.Length > 5) %>%
  desctable(tests = list(.auto = tests_auto, Species = ~chisq.test))



