library(zeallot)


### Name: destructure
### Title: Destructure an object
### Aliases: destructure

### ** Examples

# data frames become a list of columns
destructure(
  data.frame(x = 0:4, y = 5:9)
)

# strings are split into list of characters
destructure("abcdef")

# dates become list of year, month, and day
destructure(Sys.Date())

# create a new destructure implementation
shape <- function(sides = 4, color = "red") {
  structure(
    list(sides = sides, color = color),
    class = "shape"
  )
}

## Not run: 
##D # cannot destructure the shape object yet
##D c(sides, color) %<-% shape()
## End(Not run)

# implement `destructure` for shapes
destructure.shape <- function(x) {
  list(x$sides, x$color)
}

# now we can destructure shape objects
c(sides, color) %<-% destructure(shape())

sides  # 4
color  # "red"

c(sides, color) %<-% destructure(shape(3, "green"))

sides  # 3
color  # 'green'




