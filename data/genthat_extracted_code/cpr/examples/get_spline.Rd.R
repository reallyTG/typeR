library(cpr)


### Name: get_spline
### Title: Get the Control Polygon and the Spline Function
### Aliases: get_spline

### ** Examples

data(spdg, package = "cpr")

## Extract the control polygon and spline for plotting.  We'll use base R
## graphics for this example.
a_cp <- cp(pdg ~ bsplines(day, df = 10), data = spdg)

cp_and_spline <- get_spline(a_cp)
plot(cp_and_spline$cp, type = "b")
points(cp_and_spline$spline, type = "l")
grid()

# compare to the cpr:::plot.cpr_cp method
plot(a_cp, show_spline = TRUE)




