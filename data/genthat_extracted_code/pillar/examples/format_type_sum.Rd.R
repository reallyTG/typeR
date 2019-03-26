library(pillar)


### Name: format_type_sum
### Title: Format a type summary
### Aliases: format_type_sum format_type_sum.default

### ** Examples

format_type_sum(1, NULL)
pillar(1)

type_sum.accel <- function(x) {
  structure("kg m/s^2", width = 8, class = "type_sum_accel")
}
format_type_sum.type_sum_accel <- function(x, width, ...) {
  if (!is.null(width) && width < attr(x, "width")) {
    x <- substr(x, 1, width)
  }
  style_subtle(x)
}
accel <- structure(9.81, class = "accel")
pillar(accel)



