library(PKPDmisc)


### Name: strip_attributes
### Title: strip additional attributes that make dplyr fail
### Aliases: strip_attributes

### ** Examples

## Not run: 
##D foo <- data.frame(a = 1:5, b = 1:5, c=letters[1:5])
##D df <- foo
##D attr(df$a, "label") <- "col a"
##D attr(df$b, "label") <- "col b"
##D attr(df$c, "label") <- "col c"
##D 
##D library(dplyr)
##D df %>% filter(a %in% c(1, 2)) # will throw an error
##D df %>% strip_attributes("label") %>% filter(a %in% c(1, 2))
##D 
##D attr(df$a, "notes") <- "a note"
##D # now column a has attributes of label and notes
##D df %>% strip_attributes(c("label", "notes")) %>% filter(a %in% c(1, 2))
## End(Not run)



