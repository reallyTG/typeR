library(pathdiagram)


### Name: latent
### Title: Set specifications of a latent variable
### Aliases: latent

### ** Examples

## Not run: 
##D  # latent variables
##D  attack = latent("ATTACK", x=0.35, y=0.7, rx=0.08, ry=0.06)
##D  defense = latent("DEFENSE", x=0.35, y=0.3, rx=0.08, ry=0.06)
##D  success = latent("SUCCESS", x=0.65, y=0.5, rx=0.08, ry=0.06)
##D 
##D  # opwn wall
##D  wall()
##D  title("Drawing three latent variables", col.main="gray20")
##D 
##D  # draw variables
##D  draw(attack)
##D  draw(defense)
##D  draw(success)
##D  
## End(Not run)



