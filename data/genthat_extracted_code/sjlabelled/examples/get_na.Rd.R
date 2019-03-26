library(sjlabelled)


### Name: get_na
### Title: Retrieve tagged NA values of labelled variables
### Aliases: get_na

### ** Examples

library(haven)
x <- labelled(c(1:3, tagged_na("a", "c", "z"), 4:1),
              c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
                "Refused" = tagged_na("a"), "Not home" = tagged_na("z")))
# get current NA values
x
get_na(x)
# which NA has which tag?
get_na(x, as.tag = TRUE)

# replace only the NA, which is tagged as NA(c)
library(sjmisc)
replace_na(x, value = 2, tagged.na = "c")
get_na(replace_na(x, value = 2, tagged.na = "c"))

# data frame as input
y <- labelled(c(2:3, 3:1, tagged_na("y"), 4:1),
              c("Agreement" = 1, "Disagreement" = 4, "Why" = tagged_na("y")))
get_na(data.frame(x, y))





