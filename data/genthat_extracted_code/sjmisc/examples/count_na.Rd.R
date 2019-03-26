library(sjmisc)


### Name: count_na
### Title: Frequency table of tagged NA values
### Aliases: count_na

### ** Examples

library(haven)
x <- labelled(
  x = c(1:3, tagged_na("a", "c", "z"),
        4:1, tagged_na("a", "a", "c"),
        1:3, tagged_na("z", "c", "c"),
        1:4, tagged_na("a", "c", "z")),
  labels = c("Agreement" = 1, "Disagreement" = 4,
             "First" = tagged_na("c"), "Refused" = tagged_na("a"),
             "Not home" = tagged_na("z"))
)
count_na(x)

y <- labelled(
  x = c(1:3, tagged_na("e", "d", "f"),
        4:1, tagged_na("f", "f", "d"),
        1:3, tagged_na("f", "d", "d"),
        1:4, tagged_na("f", "d", "f")),
  labels = c("Agreement" = 1, "Disagreement" = 4, "An E" = tagged_na("e"),
            "A D" = tagged_na("d"), "The eff" = tagged_na("f"))
)

# create data frame
dat <- data.frame(x, y)

# possible count()-function calls
count_na(dat)
count_na(dat$x)
count_na(dat, x)
count_na(dat, x, y)




