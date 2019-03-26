library(lrequire)


### Name: lrequire
### Title: Sources an R module with optional caching for subsequent
###   attempts, exporting specified values
### Aliases: lrequire

### ** Examples

hide.not.found.warnings()  # don't warn on files not found by lrequire()

# If the module name is in a character vector, use:
my.module <- 'myplot'
mm <- lrequire(my.module, character.only = TRUE)

say.hello.to <- lrequire(hello_ex)
# say.hello.to('Rick')  # use the say.hello.to() function that was returned by lrequire()




