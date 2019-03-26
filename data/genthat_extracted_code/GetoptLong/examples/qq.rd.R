library(GetoptLong)


### Name: qq
### Title: Simple variable interpolation in texts
### Aliases: qq

### ** Examples

a = 1
b = "text"
qq("a = @{a}, b = '@{b}'")

a = 1:2
qq("a = @{a}, b = '@{b}'")
qq("a = @{a}, b = '@{b}'", collapse = FALSE)

a = 1
qq("a = `a`, b = '`b`'", code.pattern = "`CODE`")



