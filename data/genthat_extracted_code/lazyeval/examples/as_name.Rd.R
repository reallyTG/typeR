library(lazyeval)


### Name: as_name
### Title: Coerce an object to a name or call.
### Aliases: as_name as_call

### ** Examples

as_name("x + y")
as_call("x + y")

as_call(~ f)
as_name(~ f())



