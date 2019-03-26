## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(dplyr)
library(tribe)
print.list <- function(x, ...) str(x)

## ------------------------------------------------------------------------
df <- data.frame(x = 1:2, y = 2:3) %>%
  at_mutate(example="yes", package="dplyr")
tribe(df)

## ------------------------------------------------------------------------
at_slice(df, names)

## ------------------------------------------------------------------------
at_slice_(df, "class")
at_slice_(df, ~ package)

## ------------------------------------------------------------------------
df <- df %>%
  at_mutate_(package = ~ NULL, # deletes the attribute called 'package'
             example = ~ "no")
tribe(df)

## ------------------------------------------------------------------------
df <- data.frame(x = 1:2, y = 2:3) %>%
 at_mutate(example="yes",
           package="tribe", 
           class = c("my_tbl", "data.frame"))

## ------------------------------------------------------------------------
tribe(df %>% mutate(z=3))

## ------------------------------------------------------------------------
tribe(df %@>% mutate(z=3))

## ------------------------------------------------------------------------
# Attributes are lost when the object passes through dplyr verbs
df2 <- df %>% mutate(z = 3)
tribe(df2)

# Most attributes are kept
df3 <- shield(df2, tribe(df), propagate = "most")
tribe(df3)

# To keep the class, use 'keep_also'
df4 <- shield(df2, tribe(df), propagate = "most", keep_also = "class")
tribe(df4)

## ---- warning = FALSE----------------------------------------------------
"%newpipe>%" <- make_pipe(propagate="none", keep_also = "example")
tribe(df %newpipe>% mutate(z=3))

