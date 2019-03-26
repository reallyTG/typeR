library(knitr)


### Name: read_chunk
### Title: Read chunks from an external script
### Aliases: read_chunk read_demo

### ** Examples

## put this in foo.R and read_chunk('foo.R')

## ---- my-label ----
1 + 1
lm(y ~ x, data = data.frame(x = 1:10, y = rnorm(10)))

## later you can use <<my-label>>= to reference this chunk

## the 2nd approach
code = c("#@a", "1+1", "#@b", "#@a", "rnorm(10)", "#@b")
read_chunk(lines = code, labels = "foo")  # put all code into one chunk named foo
read_chunk(lines = code, labels = "foo", from = 2, to = 2)  # line 2 into chunk foo
read_chunk(lines = code, labels = c("foo", "bar"), from = c(1, 4), to = c(3, 6))
# automatically figure out 'to'
read_chunk(lines = code, labels = c("foo", "bar"), from = c(1, 4))
read_chunk(lines = code, labels = c("foo", "bar"), from = "^#@a", to = "^#@b")
read_chunk(lines = code, labels = c("foo", "bar"), from = "^#@a", to = "^#@b", 
    from.offset = 1, to.offset = -1)

## later you can use, e.g., <<foo>>=
knitr:::knit_code$get()  # use this to check chunks in the current session
knitr:::knit_code$restore()  # clean up the session



