library(memery)


### Name: meme
### Title: Generate a meme
### Aliases: meme meme meme_gif

### ** Examples

# Prepare data and make a graph
library(ggplot2)
x <- seq(0, 2*pi, length.out = 50)
panels <- rep(c("Plot A", "Plot B"), each = 50)
d <- data.frame(x = x, y = sin(x), grp = panels)
txt <- c("Philosoraptor's plots", "I like to make plots",
  "Figure 1. (A) shows a plot and (B) shows another plot.")

p <- ggplot(d, aes(x, y)) + geom_line(colour = "cornflowerblue", size = 2) +
  geom_point(colour = "orange", size = 4) + facet_wrap(~grp) +
  labs(title = txt[1], subtitle = txt[2], caption = txt[3])

# meme image background and text labels
img <- system.file("philosoraptor.jpg", package = "memery")
lab <- c("Title meme text", "Subtitle text")

## Not run: 
##D 
##D # Not run due to file size
##D # basic meme
##D meme(img, lab[1:2], "meme_basic.jpg")
##D # data analyst's meme
##D meme(img, lab[1:2], "meme_data.jpg", size = 2, inset = p, mult = 2)
## End(Not run)

# data meme with additional content control
vp_bg <- list(fill = "#FF00FF50", col = "#FFFFFF80") # graph background
# arbitrary number of labels, placement, and other vectorized attributes
lab <- c(lab, "Middle plot text")
pos <- list(w = rep(0.9, 3), h = rep(0.3, 3), x = c(0.35, 0.65, 0.5),
  y = c(0.95, 0.85, 0.3))
fam <- c("Impact", "serif", "Impact")
clrs1 <- c("black", "orange", "white")
clrs2 <- clrs1[c(2, 1, 1)]
meme(img, lab, "meme_data2.jpg", size = c(2, 1.5, 1), family = fam, col = clrs1,
  shadow = clrs2, label_pos = pos, inset = p, inset_bg = vp_bg, mult = 2)

## Not run: 
##D 
##D # Not run due to file size and software requirements
##D # GIF meme. Requires Imagemagick and magick package. See details.
##D p <- ggplot(d, aes(x, y)) + geom_line(colour = "white", size = 2) +
##D   geom_point(colour = "orange", size = 1) + facet_wrap(~grp) +
##D   labs(title = "The wiggles", subtitle = "Plots for cats",
##D        caption = "Figure 1. Gimme sine waves.")
##D lab <- c("R plots for cats", "Sine wave sine wave sine wave sine wave...")
##D pos <- list(w = rep(0.9, 2), h = rep(0.3, 2), x = rep(0.5, 2), y = c(0.9, 0.75))
##D img <- "http://forgifs.com/gallery/d/228621-4/Cat-wiggles.gif"
##D meme_gif(img, lab, "meme_data3.gif", size = c(1.5, 0.75), label_pos = pos,
##D          inset = p, inset_bg = list(fill = "#00BFFF80"), mult = 1.5, fps = 20)
## End(Not run)



