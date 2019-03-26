library(customLayout)


### Name: phl_layout
### Title: Create layout for the officer PowerPoint slide.
### Aliases: phl_layout

### ** Examples


library(officer)
library(customLayout)
library(magrittr)
library(ggplot2)

lay = lay_new(matrix(1:4,nc = 2),widths=c(3, 2),heights=c(2, 1))
lay2 = lay_new(matrix(1:3))
cl = lay_bind_col(lay,lay2, widths = c(3,1))

allPositions <- phl_layout(cl, innerMargins = rep(0.1,4))

my_pres <- read_pptx() %>% 
  add_slide(master = "Office Theme", layout = "Two Content")

p <- qplot(mpg, wt, data = mtcars)

for(pos in allPositions) {
  my_pres <- my_pres %>% officer::ph_with_gg_at(
    p, 
    width = pos["width"],
    height = pos["height"], 
    left = pos["left"],
    top = pos["top"])
}

## Not run: 
##D if(!dir.exists("tmp")) dir.create("tmp")
##D print(my_pres, target = "tmp/test-officer-layout.pptx")
## End(Not run)




