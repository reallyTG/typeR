library(wrapr)


### Name: let
### Title: Execute expr with name substitutions specified in alias.
### Aliases: let

### ** Examples


d <- data.frame(
  Sepal_Length=c(5.8,5.7),
  Sepal_Width=c(4.0,4.4),
  Species='setosa')

mapping <- qc(
  AREA_COL = Sepal_area,
  LENGTH_COL = Sepal_Length,
  WIDTH_COL = Sepal_Width
)

# let-block notation
let(
  mapping,
  d %.>%
    transform(., AREA_COL = LENGTH_COL * WIDTH_COL)
)


# Note: in packages can make assignment such as:
#   AREA_COL <- LENGTH_COL <- WIDTH_COL <- NULL
# prior to code so targets don't look like unbound names.





