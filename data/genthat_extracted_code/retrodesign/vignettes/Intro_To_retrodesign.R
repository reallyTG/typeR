## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
    collapse = TRUE,
  comment = "#>"
)


## ---- include=FALSE------------------------------------------------------
library(retrodesign)
library(ggplot2)
library(grid)
library(gridExtra)

## ------------------------------------------------------------------------
sim_plot(.5,1)

## ------------------------------------------------------------------------
retro_design(.5,1)

## ------------------------------------------------------------------------
# The posited effects Gelman and Carlin consider
retro_design(list(.1,.3,1),3.3)

# A particularly charitable set of posited effects
retro_design(list(.1,.3,1,2,3),3.3)

## ----fig.width=6---------------------------------------------------------
possible_effects <- seq(.1,10, by = .5)
effect_s_pairs <- data.frame(possible_effects,type_s(possible_effects,3.3))
effect_m_pairs <- data.frame(possible_effects,type_m(possible_effects,3.3))

s_plot<- ggplot(effect_s_pairs, aes(possible_effects, type_s)) + geom_point()
m_plot <- ggplot(effect_m_pairs, aes(possible_effects, type_m)) + geom_point()

grid.arrange(s_plot, m_plot, ncol=2)

## ------------------------------------------------------------------------
sim_plot(.5,1)

