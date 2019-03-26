library(tribe)


### Name: make_pipe
### Title: Create a pipe operator.
### Aliases: make_pipe %@>% %<@>% %try>%

### ** Examples

library(dplyr)
df <- data.frame(x = sample(10, 5, rep = TRUE),
                 y = sample(10, 5, rep = TRUE)) %>%
  at_mutate(example="yes",
            package="dplyr", 
            class = c("my_tbl", "data.frame"))
tribe(df)

# Attributes just created are lost when the object 
# passes through dplyr verbs
tribe(df %>% mutate(z=3))

# With the pipe '%@>%', most attributes are kept
tribe(df %@>% mutate(z=3))

# One can create a new pipe to adjust attributes propagation settings
"%newpipe>%" <- make_pipe(propagate="none", keep_also = "example")
tribe(df %newpipe>% mutate(z=3))




