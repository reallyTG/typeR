library(kutils)


### Name: reverse
### Title: Reverse the levels in a factor
### Aliases: reverse

### ** Examples

## Consider alphabetication of upper and lower
x <- factor(c("a", "b", "c", "C", "a", "c"))
levels(x)
xr1 <- reverse(x)
xr1
## Keep "C" at end of list, after reverse others
xr2 <- reverse(x, eol = "C")
xr2
y <- ordered(x, levels = c("a", "b", "c", "C"))
yr1 <- reverse(y)
class(yr1)[1] == "ordered"
yr1
## Hmm. end of list amounts to being "maximal".
## Unintended side-effect, but interesting.
yr2 <- reverse(y, eol = "C")
yr2
## What about a period as a value (SAS missing)
z <- factor(c("a", "b", "c", "b", "c", "."))
reverse(z)
z <- factor(c(".", "a", "b", "c", "b", "c", "."))
reverse(z)
## How about R NA's
z <- factor(c(".", "a", NA, "b", "c", "b", NA, "c", "."))
z
reverse(z)
z <- ordered(c(".", "a", NA, "b", "c", "b", NA, "c", "."))
z
str(z)
## Put "." at end of list
zr <- reverse(z, eol = ".")
zr
str(zr)
z <- ordered(c(".", "c", NA, "e", "a", "c", NA, "e", "."),
         levels = c(".", "c", "e", "a"))
reverse(z, eol = ".")
reverse(z, eol = c("a", "."))



