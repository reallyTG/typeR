library(gghighlight)


### Name: gghighlight
### Title: Highlight Data With Predicate
### Aliases: gghighlight

### ** Examples

d <- data.frame(
  idx = c( 1, 1, 1, 2, 2, 2, 3, 3, 3),
  value = c( 1, 2, 3,10,11,12, 9,10,11),
  category = rep(c("a","b","c"), 3),
  stringsAsFactors = FALSE
)

# highlight the lines whose max values are larger than 10
ggplot(d, aes(idx, value, colour = category)) +
  geom_line() + gghighlight(max(value) > 10)

# highlight the points whose values are larger than 10
ggplot(d, aes(idx, value)) +
  geom_point() +
  gghighlight(value > 10, label_key = category)




