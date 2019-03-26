library(wakefield)


### Name: peek
### Title: Data Frame Viewing
### Aliases: peek

### ** Examples

(dat1 <- r_data_frame(100, id, sentence, paragraph))
peek(dat1)
peek(dat1, n = 20)
peek(dat1, width = 40)

library(dplyr)

## Use in a dplyr/magrittr pipeline to view the data (silly example)
par(mfrow = c(2, 2))

r_data_frame(1000, id, sex, pet, employment, eye, sentence, paragraph) %>%
    peek %>%
    (function(x, ind = 2:5){ invisible(lapply(ind, function(i) pie(table(x[[i]]))))})

## A wider data set example
dat2 <- r_data_theme()

dat2
peek(dat2)



