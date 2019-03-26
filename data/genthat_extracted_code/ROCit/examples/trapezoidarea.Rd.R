library(ROCit)


### Name: trapezoidarea
### Title: Approximate Area with Trapezoid Rule
### Aliases: trapezoidarea

### ** Examples

# Area under rectangle -----------------
trapezoidarea(seq(0, 10), rep(1, 11))

# Area under triangle ------------------
trapezoidarea(seq(0, 10), seq(0, 10))

# Area under normal pdf ----------------
x_vals <- seq(-3, 3, 0.01); y_vals <- dnorm(x_vals)
trapezoidarea(x = x_vals, y = y_vals) # theoretically 1




