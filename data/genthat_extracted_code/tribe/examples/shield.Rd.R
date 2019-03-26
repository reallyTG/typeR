library(tribe)


### Name: shield
### Title: Attributes protection
### Aliases: shield

### ** Examples

library(dplyr)
df <- data.frame(x = sample(10, 5, rep = TRUE),
                 y = sample(10, 5, rep = TRUE)) %>%
  at_mutate(example="yes",
            package="dplyr", 
            class = c("my_tbl", "data.frame"))
tribe(df)

# Attributes are lost when the object passes through dplyr verbs
df2 <- df %>% 
  mutate(z = 3)
tribe(df2)

# Most attributes are kept
df3 <- shield(df2, tribe(df), propagate = "most")
tribe(df3)

# To keep the class, use 'keep_also'
df4 <- shield(df2, tribe(df), propagate = "most", keep_also = "class")
tribe(df4)




