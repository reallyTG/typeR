library(formattable)


### Name: suffix
### Title: Formattable object with suffix
### Aliases: suffix

### ** Examples

suffix(1:10, "px")
suffix(1:10, ifelse(1:10 >= 2, "units", "unit"), sep = " ")
suffix(c(1:10, NA), "km/h", na.text = "(missing)")
suffix(percent(c(0.1, 0.25)), "*")



