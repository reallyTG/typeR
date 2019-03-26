library(sjmisc)


### Name: ref_lvl
### Title: Change reference level of (numeric) factors
### Aliases: ref_lvl

### ** Examples

data(efc)
x <- to_factor(efc$e42dep)
str(x)
frq(x)

# see column "val" in frq()-output, which indicates
# how values/labels were recoded after using ref_lvl()
x <- ref_lvl(x, lvl = 3)
str(x)
frq(x)

library(dplyr)
dat <- efc %>%
  select(c82cop1, c83cop2, c84cop3) %>%
  to_factor()

frq(dat)
ref_lvl(dat, c82cop1, c83cop2, lvl = 2) %>% frq()

# compare numeric and string value for "lvl"-argument
x <- to_factor(efc$e42dep)
frq(x)
ref_lvl(x, lvl = 2) %>% frq()
ref_lvl(x, lvl = "slightly dependent") %>% frq()

# factors with non-numeric factor levels
data(iris)
levels(iris$Species)
levels(ref_lvl(iris$Species, lvl = 3))
levels(ref_lvl(iris$Species, lvl = "versicolor"))




