library(animation)


### Name: ani.pause
### Title: Pause for a while and flush the current graphical device
### Aliases: ani.pause

### ** Examples

## pause for 2 seconds
oopt = ani.options(interval = 2)

for (i in 1:5) {
    plot(runif(10), ylim = c(0, 1))
    ani.pause()
}

ani.options(oopt)

## see demo('Xmas2', package = 'animation') for another example




