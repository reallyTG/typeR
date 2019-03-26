library(svglite)


### Name: svgstring
### Title: Access current SVG as a string.
### Aliases: svgstring

### ** Examples

s <- svgstring(); s()

plot.new(); s();
text(0.5, 0.5, "Hi!"); s()
dev.off()

s <- svgstring()
plot(rnorm(5), rnorm(5))
s()
dev.off()



