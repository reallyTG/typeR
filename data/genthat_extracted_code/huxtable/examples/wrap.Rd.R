library(huxtable)


### Name: wrap
### Title: Text wrapping
### Aliases: wrap wrap<- set_wrap map_wrap

### ** Examples

ht <- huxtable(paste(
      rep("Some long text.", 20),
      collapse = " "))
width(ht) <- 0.2
wrap(ht) <- TRUE
## Not run: 
##D   quick_html(ht)
## End(Not run)


jams2 <- set_wrap(jams,
      TRUE)
wrap(jams2)

jams3 <- set_wrap(jams,
      2:3, 1, TRUE)
wrap(jams3)

jams4 <- map_wrap(jams,
      by_rows(
        TRUE,
        FALSE)
      )
wrap(jams4)



