library(multicolor)


### Name: multi_color
### Title: Multi-color text
### Aliases: multi_color

### ** Examples

## Not run: 
##D multi_color()
##D 
##D multi_color("ahoy")
##D 
##D multi_color("taste the rainbow",
##D             c("mediumpurple",
##D               "rainbow",
##D              "cyan3"))
##D 
##D multi_color(colors = c(rgb(0.1, 0.2, 0.5),
##D                        "yellow",
##D                        rgb(0.2, 0.9, 0.1)))
##D 
##D multi_color(
##D   cowsay::animals[["buffalo"]],
##D   c("mediumorchid4", "dodgerblue1", "lemonchiffon1"))
##D 
##D multi_color(cowsay:::rms, sample(colors(), 10))
##D 
##D # Mystery Bulgarian animal
##D multi_color(things[[sample(length(things), 1)]],
##D             c("white", "darkgreen", "darkred"),
##D             direction = "horizontal")
##D 
##D # Mystery Italian animal
##D multi_color(things[[sample(length(things), 1)]],
##D             c("darkgreen", "white", "darkred"),
##D             direction = "vertical")
## End(Not run)



