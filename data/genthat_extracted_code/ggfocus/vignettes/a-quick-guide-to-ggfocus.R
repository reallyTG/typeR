## ---- setup, include=FALSE-----------------------------------------------
knitr::opts_chunk$set(fig.width = 6, collapse = TRUE)

## ------------------------------------------------------------------------
library(ggplot2)
library(ggfocus)
library(gapminder)

p1 <- ggplot(gapminder, aes(x = year, y = lifeExp, color = continent, group = country)) + geom_line()
p1

## ------------------------------------------------------------------------
p1 %>% ggfocus(var = continent, focus_levels = c("Europe"), focus_aes = c("color","alpha"),
          color_focus = "red", alpha_focus = 1, alpha_other = 0.15)

## ------------------------------------------------------------------------
#p1 + scale_alpha_focus(focus_levels = "Europe") # This throws an error because alpha isn't mapped by any variable.
p1 + aes(alpha = continent) + scale_alpha_focus("Europe", 1, 0.15) + scale_color_focus("Europe")

## ------------------------------------------------------------------------
p2 <- ggplot(gapminder, aes(x = year, y = lifeExp, color = country, group = country)) + geom_line()
p2 + scale_color_focus(focus_levels = c("Brazil","Argentina")) + aes(alpha = country) +
  scale_alpha_focus(c("Brazil","Argentina"))
# Same as 
# p2 %>% ggfocus(var = country, focus_levels = c("Brazil","Argentina"))

## ------------------------------------------------------------------------
p3 <- ggplot(gapminder, aes(x = log(pop), fill = continent)) + geom_histogram()
p3
p3 + scale_fill_focus(c("Asia"))
# Same as
# p3 %>% ggfocus(var = continent, focus_levels = "Asia", focus_aes = "fill", color_other = "gray")

