library(rbokeh)


### Name: ly_abline
### Title: Add an "abline" layer to a Bokeh figure
### Aliases: ly_abline

### ** Examples

# abline with mixed axes for h and v
figure() %>%
  ly_points(1:26, letters) %>%
  ly_abline(h = "j") %>%
  ly_abline(v = 10)

# multiple hv lines
figure() %>%
  ly_points(1:10) %>%
  ly_abline(v = 1:10) %>%
  ly_abline(h = 1:10)

# multiple ab lines
figure() %>%
  ly_points(0:10) %>%
  ly_abline(0, seq(0, 1, by = 0.1))
## No test: 
z <- lm(dist ~ speed, data = cars)
p <- figure() %>%
  ly_points(cars, hover = cars) %>%
  ly_lines(lowess(cars), legend = "lowess") %>%
  ly_abline(z, type = 2, legend = "lm", width = 2)
p
## End(No test)



