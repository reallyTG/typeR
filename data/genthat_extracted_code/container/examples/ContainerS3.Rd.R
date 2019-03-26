library(container)


### Name: ContainerS3
### Title: Container S3 interface
### Aliases: ContainerS3 container as.container is.container add clear
###   clone discard empty has remove size type values

### ** Examples

c0 <- container(list(2, "A"))
size(c0)                         # 2
add(c0, 1)
c0$has(2)                        # TRUE
discard(c0, 2)
has(c0, 2)                       # FALSE

## Not run: 
##D c0$remove(2)                     # Error : 2 not in Container
## End(Not run)
discard(c0, 2)                   # ok (no effect)

type(container(list("A", 1)))    # "list"
type(container(numeric(0)))      # "double"
type(container(0+0i))            # "complex"
type(container(letters[1:3]))    # "character"
values(container(letters[1:3]))  # "a" "b" "c"
type(container(1L))              # "integer"
values(add(container(1L), 2.3))  # since integer type, equals c(1, 2)



