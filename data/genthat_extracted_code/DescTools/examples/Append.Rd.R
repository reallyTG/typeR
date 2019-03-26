library(DescTools)


### Name: Append
### Title: Append Elements to Objects
### Aliases: Append Append.matrix Append.data.frame Append.default
### Keywords: manip

### ** Examples

Append(1:5, 0:1, after = 3)    # the same as append

# Insert columns and rows
x <- matrix(runif(25), 5)

Append(x, values=1:10, after=2, names = c("X","Y"))
Append(x, values=1:10, after=2)

Append(x, values=1:10, after=2, names = c("X","Y"))
Append(x, values=1:10, after=2)

# append to a data.frame
d.frm <- data.frame("id"   = c(1,2,3),
                    "code" = c("AAA", "BBB", "CCC"),
                    "val"  = c(111, 222, 333))
z <- c(10, 20, 30)

Append(d.frm, z, after=2, names="ZZZ")



