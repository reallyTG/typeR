library(Smisc)


### Name: pvar
### Title: Prints the name and value of one or more objects
### Aliases: pvar
### Keywords: misc

### ** Examples

x <- 10
y <- 20.728923
z <- "This.long.string"

pvar(x, y, z)
pvar(x, y, z, digits = 2)
pvar(x, y, z, abbrev = 4)
pvar(x, y, z, digits = 2, abbrev = 4)
pvar(x, y, z, sep = ",")

# values can be vectors too
x <- 10:12
y <- c("This","That")
v2 <- pvar(x, y, verbose = FALSE)
v2

# Or a simple list
pvar(list(x = 1:2, y = "this", z = TRUE))

# Can be useful for keeping track of iterations in loops
for (i in 1:2) {
  for (j in letters[1:2]) {
    for (k in c("this","that")) {
      pvar(i, j, k)
    }
  }
}



