library(storr)


### Name: storr
### Title: Object cache
### Aliases: storr

### ** Examples

st <- storr(driver_environment())
## Set "mykey" to hold the mtcars dataset:
st$set("mykey", mtcars)
## and get the object:
st$get("mykey")
## List known keys:
st$list()
## List hashes
st$list_hashes()
## List keys in another namespace:
st$list("namespace2")
## We can store things in other namespaces:
st$set("x", mtcars, "namespace2")
st$set("y", mtcars, "namespace2")
st$list("namespace2")
## Duplicate data do not cause duplicate storage: despite having three
## keys we only have one bit of data:
st$list_hashes()
st$del("mykey")

## Storr objects can be created that have a default namespace that is
## not "objects" by using the \code{default_namespace} argument (this
## one also points at the same memory as the first storr).
st2 <- storr(driver_environment(st$driver$envir),
             default_namespace = "namespace2")
## All functions now use "namespace2" as the default namespace:
st2$list()
st2$del("x")
st2$del("y")



