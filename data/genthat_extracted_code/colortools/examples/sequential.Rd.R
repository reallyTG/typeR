library(colortools)


### Name: sequential
### Title: sequential HSV colors
### Aliases: sequential

### ** Examples

# sequence for 'orange'
sequential("orange")

# sequence for 'orange' with fun='sqrt' transformation
sequential("orange", fun = "sqrt")

# sequence for 'orange' with fun='log' transformation
sequential("orange", fun = "log")

# sequential sequence for value with fix saturation s=0.7 and fun='log'
sequential("orange", what = "value", s = 0.7, fun = "log")

# sequential sequence for saturation, with fix value s=0.8, alpha=0.5, percentage 10, and fun='log'
sequential("orange", 10, what = "value", s = 0.7, alpha = 0.5, fun = "log")



