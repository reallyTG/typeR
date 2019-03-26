library(ggplot2)


### Name: aes_
### Title: Define aesthetic mappings programmatically
### Aliases: aes_ aes_string aes_q

### ** Examples

# Three ways of generating the same aesthetics
aes(mpg, wt, col = cyl)
aes_(quote(mpg), quote(wt), col = quote(cyl))
aes_(~mpg, ~wt, col = ~cyl)
aes_string("mpg", "wt", col = "cyl")

# You can't easily mimic these calls with aes_string
aes(`$100`, colour = "smooth")
aes_(~ `$100`, colour = "smooth")
# Ok, you can, but it requires a _lot_ of quotes
aes_string("`$100`", colour = '"smooth"')

# Convert strings to names with as.name
var <- "cyl"
aes(col = x)
aes_(col = as.name(var))



