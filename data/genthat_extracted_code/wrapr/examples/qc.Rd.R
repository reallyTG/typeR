library(wrapr)


### Name: qc
### Title: Quoting version of c() array concatenate.
### Aliases: qc

### ** Examples


a <- "x"

qc(a) # returns the string "a" (not "x")

qc(.(a)) # returns the string "x" (not "a")

qc(.(a) := a) # returns c("x" = "a")

qc("a") # return the string "a" (not "\"a\"")

qc(sin(x))  # returns the string "sin(x)"

qc(a, qc(b, c)) # returns c("a", "b", "c")

qc(a, c("b", "c")) # returns c("a", "b", "c")

qc(x=a, qc(y=b, z=c)) # returns c(x="a", y="b", z="c")

qc('x'='a', wrapr::qc('y'='b', 'z'='c')) # returns c(x="a", y="b", z="c")

c(a = c(a="1", b="2")) # returns c(a.a = "1", a.b = "2")
qc(a = c(a=1, b=2)) # returns c(a.a = "1", a.b = "2")
qc(a := c(a=1, b=2)) # returns c(a.a = "1", a.b = "2")





