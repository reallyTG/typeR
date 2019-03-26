library(ggplot2)


### Name: fortify.map
### Title: Fortify method for map objects
### Aliases: fortify.map
### Keywords: internal

### ** Examples

if (require("maps")) {
ca <- map("county", "ca", plot = FALSE, fill = TRUE)
head(fortify(ca))
ggplot(ca, aes(long, lat)) +
  geom_polygon(aes(group = group))

tx <- map("county", "texas", plot = FALSE, fill = TRUE)
head(fortify(tx))
ggplot(tx, aes(long, lat)) +
  geom_polygon(aes(group = group), colour = "white")
}



