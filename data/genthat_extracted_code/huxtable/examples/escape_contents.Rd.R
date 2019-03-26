library(huxtable)


### Name: escape_contents
### Title: Escape cell contents
### Aliases: escape_contents escape_contents<- set_escape_contents
###   map_escape_contents

### ** Examples

ht <- huxtable(
        Exponent = 2:4,
        Example  = paste0("$x^", 2:4, "$"),
        add_colnames = TRUE
      )
escape_contents(ht)[,2] <- FALSE
## Not run: 
##D   quick_pdf(ht)
## End(Not run)


jams2 <- set_escape_contents(jams,
      TRUE)
escape_contents(jams2)

jams3 <- set_escape_contents(jams,
      2:3, 1, TRUE)
escape_contents(jams3)

jams4 <- map_escape_contents(jams,
      by_rows(
        TRUE,
        FALSE)
      )
escape_contents(jams4)



