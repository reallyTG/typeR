## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(ggplot2)
library(rasterVis)
theme_clean = function (base_size = 12, base_family = ""){
  theme_grey(base_size = base_size, base_family = base_family) %+replace% 
    theme(axis.line = element_blank(), axis.text.x = element_blank(), 
      axis.text.y = element_blank(), axis.ticks = element_blank(), 
      axis.title.x = element_blank(), axis.title.y = element_blank(), 
      axis.ticks.length = grid::unit(0, "lines"), legend.position = "none", 
      panel.background = element_blank(), panel.border = element_blank(), 
      panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
      panel.spacing = grid::unit(0, "lines"), plot.background = element_blank(), 
      strip.background = element_rect(colour = "#ffffff", 
        fill = "#eeeeee"))
}
theme_set(theme_clean())

## ---- message=FALSE------------------------------------------------------
library(raster)
library(belg)

## ---- fig.height=4, echo=FALSE-------------------------------------------
gplot(complex_land) + 
  geom_tile(aes(fill = value), color = "black", size = 2) +
  geom_text(aes(label = value), size = 4, color = "black") +
  coord_equal() +
  scale_fill_distiller(palette = "RdYlBu") +
  labs(title = "Complex landscape")
gplot(simple_land) + 
  geom_tile(aes(fill = value), color = "black", size = 2) +
  geom_text(aes(label = value), size = 4, color = "black") +
  coord_equal() +
  scale_fill_distiller(palette = "RdYlBu") +
  labs(title = "Simple landscape")

## ------------------------------------------------------------------------
get_boltzmann(complex_land)
get_boltzmann(simple_land)

## ------------------------------------------------------------------------
get_boltzmann(complex_land) # log10
get_boltzmann(complex_land, base = "log")
get_boltzmann(complex_land, base = "log2")

## ------------------------------------------------------------------------
get_boltzmann(complex_land, relative = TRUE)

## ---- fig.height=4, echo=FALSE-------------------------------------------
complex_land_l1 = complex_land
complex_land_l2 = raster(matrix(c(53, 32, 81, 58, 76, 80, 44, 59, 41, 47, 57, 50, 
                                  51, 49), ncol = 7))
gplot(complex_land_l1) + 
  geom_tile(aes(fill = value), color = "black", size = 2) +
  geom_text(aes(label = value), size = 4, color = "black") +
  coord_equal() +
  scale_fill_distiller(palette = "RdYlBu", limits = c(12, 98)) +
  labs(title = "Original dataset (Level 1)")
gplot(complex_land_l2) + 
  geom_tile(aes(fill = value), color = "black", size = 2) +
  geom_text(aes(label = value), size = 4, color = "black") +
  coord_equal() +
  scale_fill_distiller(palette = "RdYlBu", limits = c(12, 98)) +
  labs(title = "Resampled dataset (Level 2)")

## ------------------------------------------------------------------------
get_boltzmann(complex_land, relative = FALSE)

## ------------------------------------------------------------------------
win_1 = raster(matrix(c(1, 3, 3, 4), ncol = 2))
win_2 = raster(matrix(c(1, 3, 3, NA), ncol = 2))
win_3 = raster(matrix(c(1, 3, NA, NA), ncol = 2))
win_4 = raster(matrix(c(1, NA, NA, NA), ncol = 2))
win_5 = raster(matrix(c(NA, NA, NA, NA), ncol = 2))

## ---- echo = FALSE-------------------------------------------------------
val_cols = c("1" = "#fc8d59", "3" = "#ffffbf", "4" = "#91bfdb")
gplot(win_1) + 
  geom_tile(aes(fill = as.factor(value)), color = "black", size = 2) +
  geom_text(aes(label = value), size = 6) +
  scale_fill_manual(values = val_cols) +
  labs(title = "Window 1")

## ------------------------------------------------------------------------
get_boltzmann(win_1)

## ---- echo = FALSE-------------------------------------------------------
gplot(win_2) + 
  geom_tile(aes(fill = as.factor(value)), color = "black", size = 2) +
  geom_text(aes(label = c(1, 3, 3, "NA")), size = 6) +
  scale_fill_manual(values = val_cols) +
  labs(title = "Window 2")

## ---- echo = FALSE-------------------------------------------------------
win_2_1 = win_2
win_2_2 = raster(matrix(c(3, 1, 3, NA), ncol = 2))
win_2_3 = raster(matrix(c(3, 3, 1, NA), ncol = 2))

gplot(win_2_1) + 
  geom_tile(aes(fill = as.factor(value)), color = "black", size = 2) +
  geom_text(aes(label = c(1, 3, 3, "NA")), size = 6) +
  scale_fill_manual(values = val_cols) +
  labs(title = "Window 2", subtitle = "Microstate I")
gplot(win_2_2) + 
  geom_tile(aes(fill = as.factor(value)), color = "black", size = 2) +
  geom_text(aes(label = c(3, 3, 1, "NA")), size = 6) +
  scale_fill_manual(values = val_cols) +
  labs(title = "Window 2", subtitle = "Microstate II")
gplot(win_2_3) + 
  geom_tile(aes(fill = as.factor(value)), color = "black", size = 2) +
  geom_text(aes(label = c(3, 1, 3, "NA")), size = 6) +
  scale_fill_manual(values = val_cols) +
  labs(title = "Window 2", subtitle = "Microstate III")

## ------------------------------------------------------------------------
get_boltzmann(win_2)

## ---- echo = FALSE-------------------------------------------------------
win_3_1 = win_3
win_3_2 = raster(matrix(c(3, 1, NA, NA), ncol = 2))
gplot(win_3_1) + 
  geom_tile(aes(fill = as.factor(value)), color = "black", size = 2) +
  geom_text(aes(label = c(1, "NA", 3, "NA")), size = 6) +
  scale_fill_manual(values = c("#fc8d59", "#ffffbf", "#91bfdb")) +
  labs(title = "Window 3", subtitle = "Microstate I")
gplot(win_3_2) + 
  geom_tile(aes(fill = as.factor(value)), color = "black", size = 2) +
  geom_text(aes(label = c(3, "NA", 1, "NA")), size = 6) +
  scale_fill_manual(values = c("#fc8d59", "#ffffbf", "#91bfdb")) +
  labs(title = "Window 3", subtitle = "Microstate II")

## ------------------------------------------------------------------------
get_boltzmann(win_3)

## ---- echo = FALSE-------------------------------------------------------
gplot(win_4) + 
  geom_tile(aes(fill = as.factor(value)), color = "black", size = 2) +
  geom_text(aes(label = c(1, "NA", "NA", "NA")), size = 6) +
  scale_fill_manual(values = c("#fc8d59", "#ffffbf", "#91bfdb")) +
  labs(title = "Window 4")

## ------------------------------------------------------------------------
get_boltzmann(win_4)

## ---- echo = FALSE-------------------------------------------------------
gplot(win_5) + 
  geom_tile(fill = "white", color = "black", size = 2) +
  geom_text(aes(label = c("NA", "NA", "NA", "NA")), size = 6) +
  labs(title = "Window 5")

## ------------------------------------------------------------------------
get_boltzmann(win_5)

