library(childsds)


### Name: make_percentile_tab
### Title: calculate raw values
### Aliases: make_percentile_tab

### ** Examples

ptab <- make_percentile_tab(ref = kro.ref,
                            item = "height",
                           perc = c(2.5,10,50,90,97.5),
                           stack = TRUE)

ggplot2::ggplot(ptab, ggplot2::aes(x = age, y = value, colour = variable)) +
   ggplot2::geom_line() +
   ggplot2::facet_wrap(~ sex, nrow = 2)



