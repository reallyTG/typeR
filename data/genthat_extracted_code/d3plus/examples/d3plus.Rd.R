library(d3plus)


### Name: d3plus
### Title: An 'htmlwidget' interface to the d3plus javascript chart library
### Aliases: d3plus d3plus-package d3plus

### ** Examples

dta <- data.frame(
         id = c("alpha", "alpha", "alpha", "beta", "beta", "beta"),
         x = c(4,5,6,4,5,6),
         y = c(7,25,13,7,8,13)
       )

d3plus() %>% d3p_data(dta) %>% d3p_type("bar")
d3plus() %>% d3p_data(dta) %>% d3p_type("hbar")
d3plus() %>% d3p_data(dta) %>% d3p_type("area")




