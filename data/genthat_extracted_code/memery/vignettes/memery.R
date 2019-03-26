## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", fig.path = "man/figures/README-",
  message = FALSE, warning = FALSE, error = FALSE, tidy = TRUE, results = "hide"
)

## ----sources_and_outputs0, echo=FALSE------------------------------------
library(memery) # run this block in case later block would error on URL timeout
loc <- system.file("philosoraptor.jpg", package = "memery")
lab <- c("What to call my R package?", "Perhaps...")
meme(loc, lab[1], "meme1.jpg")

## ----app, eval=FALSE-----------------------------------------------------
#  library(memery)
#  memeApp()

## ----sources_and_outputs1, eval=FALSE------------------------------------
#  loc <- system.file("philosoraptor.jpg", package = "memery")
#  web <- "https://imgflip.com/s/meme/Philosoraptor.jpg"
#  lab <- c("What to call my R package?", "Perhaps...")
#  meme(loc, lab[1], "meme1.jpg")
#  meme(web, lab[1], "meme1.png")

## ----two_labels----------------------------------------------------------
meme(loc, lab, "meme2.jpg")

## ----text_pos, results="show"--------------------------------------------
text_position(n = 2)

## ----colors--------------------------------------------------------------
clrs <- c("orange", "white")
meme(loc, lab, "meme3.jpg", col = clrs[1], shadow = clrs[2])

## ----inset1--------------------------------------------------------------
library(ggplot2)
x <- seq(0, 2*pi , length.out = 50)
panels <- rep(paste("Philosoraptor's plot", c("A", "B")), each = 50)
d <- data.frame(x = x, y = sin(x), grp = panels)
txt <- c("Philosoraptor's plots", "I like to make plots", "Figure 1. (A) shows a plot and (B) shows another plot.")
p <- ggplot(d, aes(x, y)) + geom_line(colour = "cornflowerblue", size = 2) +
  geom_point(colour = "orange", size = 4) + facet_wrap(~grp) +
  labs(title = txt[1], subtitle = txt[2], caption = txt[3])

meme(loc, lab, "meme4a.jpg", inset = p)

## ----seed----------------------------------------------------------------
set.seed(1)

## ----inset1b-------------------------------------------------------------
p2 <- ggplot(data.frame(x = rnorm(10000)), aes(x)) +
  geom_density(adjust = 2, colour = "white", size = 1)
pos <- list(w = 0.2, h = 0.2, x = 0.125, y = 0.125)
meme(loc, lab[1], "meme4b.jpg", inset = p2, inset_bg = list(fill = "dodgerblue", col = "black"), inset_pos = pos, ggtheme = theme_void())

## ----inset1c-------------------------------------------------------------
pos <- inset_position("bl", size = c(0.4, 0.2), margin = c(0.025, 0.05))
meme(loc, lab[1], "meme4b2.jpg", inset = p2, inset_bg = list(fill = "firebrick1", col = "white"), inset_pos = pos, ggtheme = theme_void())

## ----inset2--------------------------------------------------------------
meme(loc, lab[1], "meme4c.jpg", size = 2, inset = p, mult = 2)

## ----inset3--------------------------------------------------------------
vp_bg <- list(fill = "#FF00FF50", col = "#FFFFFF80")
meme(loc, lab[1], "meme4d.jpg", size = 2, inset = p, inset_bg = vp_bg, mult = 2)

## ----inset3_r, eval=FALSE------------------------------------------------
#  list(r = unit(0.1, "snpc"))

## ----inset4--------------------------------------------------------------
lab[2:3] <- c("Perhaps raptr... NO!!!", "Pfft. Figures.")
lab_pos <- list(w = rep(0.9, 3), h = rep(0.3, 3), x = rep(0.5, 3), y = c(0.95, 0.85, 0.3))
meme(loc, lab, "meme5.jpg", size = c(1.25, 2.5, 1), family = c("serif", "Impact", "Impact"), col = clrs, shadow = rev(clrs), label_pos = lab_pos, inset = p, mult = 2)

## ----gifs, eval=FALSE----------------------------------------------------
#  d$grp <- gsub("Philosoraptor's", "Cat's", d$grp)
#  p <- ggplot(d, aes(x, y)) + geom_line(colour = "white", size = 2) +
#    geom_point(colour = "orange", size = 1) + facet_wrap(~grp) +
#    labs(title = "The wiggles", subtitle = "Plots for cats",
#         caption = "Figure 1. Gimme sine waves.")
#  lab <- c("R plots for cats", "Sine wave sine wave...")
#  pos <- list(w = rep(0.9, 2), h = rep(0.3, 2), x = rep(0.5, 2), y = c(0.9, 0.75))
#  img <- "http://forgifs.com/gallery/d/228621-4/Cat-wiggles.gif"
#  meme_gif(img, lab, "sine.gif", size = c(1.5, 0.75), label_pos = pos,
#           inset = p, inset_bg = list(fill = "#00BFFF80"), fps = 20)

