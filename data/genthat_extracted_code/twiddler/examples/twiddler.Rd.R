library(twiddler)


### Name: twiddle
### Title: Interactive manipulation of R expressions
### Aliases: twiddle

### ** Examples

## Not run: 
##D twiddle(print(x))
##D twiddle(print(x), eval = FALSE)
##D twiddle(print(a && !b), a = toggle(), b = toggle())
##D twiddle(curve(sin(a * x) + cos(b * x), type = "l", col = "darkblue"),
##D         a = knob(c(0, 0.1), 0.001),
##D         b = knob(c(0, 0.2), 0.001),
##D         auto = FALSE)
##D twiddle(plot(rnorm(100), type=t), t=combo("p", "l", "b"))
## End(Not run)



