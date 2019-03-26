library(seplyr)


### Name: arrange_se
### Title: Arrange standard interface.
### Aliases: arrange_se

### ** Examples


datasets::mtcars %.>%
  arrange_se(., c("cyl", "desc(gear)")) %.>%
  head(.)
# equivilent to dplyr/magrittr pipeline
# arrange(datasets::mtcars, cyl, desc(gear)) %>% head()

# Note: arranging in the presence of groups is subtle.
# As grouping is an annotation, not an ordering (and ordering is
# unfortunately not an annotation).

d <- data.frame(x = 1:6,
                sin_x = sin(1:6),
                grp = rep(c("a", "b"), 3),
                stringsAsFactors = FALSE)

# arranged by sin_x and not by grp
d %.>%
  group_by_se(., "grp") %.>%
  arrange_se(., "sin_x")

# arranged by sin_x and not by grp
d %.>%
  arrange_se(., "sin_x") %.>%
  group_by_se(., "grp")

# arranged by sin_x and not by grp
d %.>%
  group_by_se(., "grp") %.>%
  arrange_se(., "sin_x", .by_group = TRUE)

# arranged by sin_x and not by grp
d %.>%
  arrange_se(., "sin_x", .by_group = TRUE) %.>%
  group_by_se(., "grp")




