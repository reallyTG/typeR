library(tourr)


### Name: animate
### Title: Animate a tour path.
### Aliases: animate

### ** Examples

f <- flea[, 1:6]
animate(f, grand_tour(), display_xy())
# or in short
animate(f)
animate(f, max_frames = 30)

## Not run: animate(f, max_frames = 10, fps = 1, aps = 0.1)



