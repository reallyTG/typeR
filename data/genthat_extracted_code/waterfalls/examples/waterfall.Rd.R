library(waterfalls)


### Name: waterfall
### Title: Create waterfall charts
### Aliases: waterfall

### ** Examples

waterfall(values = round(rnorm(5), 1), labels = letters[1:5], calc_total = TRUE)
waterfall(.data = data.frame(category = letters[1:5],
                             value = c(100, -20, 10, 20, 110)), 
          fill_colours = colorRampPalette(c("#1b7cd6", "#d5e6f2"))(5),
          fill_by_sign = FALSE)



