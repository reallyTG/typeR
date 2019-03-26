library(datamaps)


### Name: add_labels
### Title: Add labels
### Aliases: add_labels

### ** Examples

states <- data.frame(st = c("AR", "NY", "CA", "IL", "CO", "MT", "TX"),
    val = c(10, 5, 3, 8, 6, 7, 2))

states %>%
    datamaps("usa") %>%
    add_choropleth(st, val) %>%
    add_labels(label.color = "blue")




