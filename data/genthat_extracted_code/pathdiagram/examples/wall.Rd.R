library(pathdiagram)


### Name: wall
### Title: Open a new frame for a path diagram
### Aliases: wall

### ** Examples

## Not run: 
##D  # latent variables
##D  attack = latent("ATTACK", x=0.35, y=0.7, rx=0.08, ry=0.06)
##D  defense = latent("DEFENSE", x=0.35, y=0.3, rx=0.08, ry=0.06)
##D  success = latent("SUCCESS", x=0.65, y=0.5, rx=0.08, ry=0.06)
##D 
##D  # open diagram
##D  wall()
##D 
##D  # draw latent variables
##D  draw(attack)
##D  draw(defense)
##D  draw(success)
##D 
##D  # add arrows
##D  arrow(from=attack, to=success, start="east", end="west")
##D  arrow(from=defense, to=success, start="east", end="west")
##D  
## End(Not run)



