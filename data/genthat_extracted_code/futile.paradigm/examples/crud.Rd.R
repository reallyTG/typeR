library(futile.paradigm)


### Name: crud
### Title: API for CRUD-like operations
### Aliases: create create.default
### Keywords: programming methods

### ** Examples

create.Car <- function(T, wheels=4, doors=4) list(wheels=wheels, doors=doors)

# This is how you inherit from a type
create.SportsCar <- function(T, doors=2, ...)
  create(Car, doors=doors, ...)

my.car <- create(Car, doors=5)

your.car <- create('SportsCar')

# The type can be passed in via a variable as well
her.class <- 'Car'
her.car <- create(her.class, wheels=3)

my.car %isa% Car
your.car %isa% SportsCar



