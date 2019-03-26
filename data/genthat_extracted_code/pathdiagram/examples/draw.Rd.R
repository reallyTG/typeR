library(pathdiagram)


### Name: draw
### Title: Draw manifest and latent variables
### Aliases: draw

### ** Examples

## Not run: 
##D  # manifest variables
##D  ingredients = list(
##D    eggs = manifest("eggs", x=0.3, y=0.7, width=0.10, height=0.08),
##D    milk = manifest("milk", x=0.3, y=0.6, width=0.10, height=0.08),
##D    flour = manifest("flour", x=0.3, y=0.5, width=0.10, height=0.08),
##D    sugar = manifest("sugar", x=0.3, y=0.4, width=0.10, height=0.08),
##D    butter = manifest("butter", x=0.3, y=0.3, width=0.10, height=0.08)
##D  )
##D 
##D  # latent variables
##D  pancakes = latent("PANCAKES", x=0.6, y=0.6, rx=0.09, ry=0.07)
##D  waffles = latent("WAFFLES", x=0.6, y=0.4, rx=0.09, ry=0.07)
##D 
##D  # open wall
##D  wall()
##D 
##D  title("Toy Path Diagram", col.main="gray20")
##D  # draw manifest variables
##D  for (i in 1:length(ingredients)) {
##D     draw(ingredients[[i]])
##D  }
##D 
##D  # draw latent variables
##D  draw(pancakes)
##D  draw(waffles)
##D  # draw arrows
##D  for (i in 1:length(ingredients)) {
##D     arrow(from=ingredients[[i]], to=pancakes, start="east", end="west")
##D     arrow(from=ingredients[[i]], to=waffles, start="east", end="west")
##D  }
##D  
## End(Not run)



