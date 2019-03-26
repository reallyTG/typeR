library(munsell)


### Name: hvc2mnsl
### Title: Converts a hue, chroma and value to a Munsell colour
### Aliases: hvc2mnsl

### ** Examples

hvc2mnsl("5PB", 5, 10)
# All values of 5PB with chroma 10
hvc2mnsl("5PB", 1:9, 10) # note some are undefined
plot_mnsl(hvc2mnsl("5PB", 1:9, 10))



