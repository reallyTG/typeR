library(tribe)


### Name: at_mutate
### Title: Manipulate attributes in a dplyr fashion
### Aliases: at_mutate at_mutate_ at_select at_select_ at_rename at_rename_
###   at_slice at_slice_

### ** Examples

library(dplyr)
df <- data.frame(x = sample(10, 5, rep = TRUE),
                 y = sample(10, 5, rep = TRUE)) %>%
  at_mutate(example="yes",
            package="dplyr")
tribe(df)

at_slice(df, names)
at_slice_(df, "class")
at_slice_(df, ~ package)

df <- df %>%
  at_mutate_(package = ~ NULL,
             example = ~ "no")
tribe(df)

df <- df %>% 
  at_mutate_(.dots = list(x =~ 2, y =~ c(3,4)))
tribe(df)




