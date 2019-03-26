library(pixiedust)


### Name: as.data.frame.dust
### Title: Convert 'dust' Object to Data Frame
### Aliases: as.data.frame.dust as.data.frame.dust_list

### ** Examples

fit <- lm(mpg ~ qsec + factor(am) + wt * factor(gear), data = mtcars)
Dust <- dust(fit) %>%
  sprinkle(cols = 2:4, round = 2) %>%
  sprinkle(cols = 5, fn = quote(pvalString(value))) %>%
  sprinkle(cols = 3, font_color = "#DA70D6") %>%
  sprinkle_print_method("html")
  
as.data.frame(Dust)




