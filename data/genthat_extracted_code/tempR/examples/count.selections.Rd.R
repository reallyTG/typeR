library(tempR)


### Name: count.selections
### Title: Count attribute selections
### Aliases: count.selections

### ** Examples

data(bars)
paste0(bars[1, -c(1:4)], collapse = "")
# this attribute was checked 3 times and unchecked 2 times
count.selections(bars[1, -c(1:4)])
count.selections(bars[1, -c(1:4)], deselections = TRUE)



