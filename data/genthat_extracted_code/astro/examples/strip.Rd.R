library(astro)


### Name: strip
### Title: Strip Leading/Trailing Characters
### Aliases: strip
### Keywords: data

### ** Examples

require("astro")

x = "   'lee'   "

strip(x, strip=" ")
#[1] "'lee'"

strip(x, strip=c(" ","'"))
#[1] "lee"

strip(x, strip=c("'"," "))
#[1] "'lee'"




