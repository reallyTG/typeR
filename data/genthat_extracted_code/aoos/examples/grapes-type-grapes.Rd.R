library(aoos)


### Name: %type%
### Title: Types
### Aliases: %type%

### ** Examples

# This will create an S4-class named 'Test' with two slots; x = "numeric"
# and y = "list"; prototype: list(x = 1, y = list()); and an initialize
# method where some checks are performed.

Test(x = 1, y = list()) %type% {
  stopifnot(.Object@x > 0)
  .Object
}

# This will create an S4-class named 'Numeric' with a slot and some tests.

numeric : Numeric(metaInfo = character()) %type% {
  stopifnot(length(.Object) > 0)
  stopifnot(all(.Object > 0))
  .Object
}

# This will create an S4-class with slots, where the constructor function has
# no defaults. All slots will allow for ANY type.

Anything(x, y ~ ANY, z = NULL) %type% .Object
## Not run: 
##D   Anything() # error because x and y are missing
## End(Not run)

# Type Unions:
'character | numeric' : Either(either ~ character | numeric) %type% .Object
Either("", 1)




