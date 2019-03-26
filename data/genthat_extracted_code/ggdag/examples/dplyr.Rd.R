library(ggdag)


### Name: dplyr
### Title: Dplyr verb methods for 'tidy_dagitty' objects
### Aliases: dplyr select.tidy_dagitty dplyr filter.tidy_dagitty dplyr
###   mutate.tidy_dagitty dplyr summarise.tidy_dagitty dplyr
###   arrange.tidy_dagitty dplyr group_by.tidy_dagitty dplyr
###   ungroup.tidy_dagitty dplyr transmute.tidy_dagitty dplyr
###   distinct.tidy_dagitty dplyr full_join.tidy_dagitty dplyr
###   inner_join.tidy_dagitty dplyr left_join.tidy_dagitty dplyr
###   right_join.tidy_dagitty dplyr anti_join.tidy_dagitty dplyr
###   semi_join.tidy_dagitty dplyr slice.tidy_dagitty dplyr
###   select_.tidy_dagitty dplyr filter_.tidy_dagitty dplyr
###   mutate_.tidy_dagitty dplyr summarise_.tidy_dagitty dplyr
###   arrange_.tidy_dagitty dplyr slice_.tidy_dagitty

### ** Examples

library(dplyr)
tidy_dagitty(m_bias()) %>%
  group_by(name) %>%
  summarize(n = n())



