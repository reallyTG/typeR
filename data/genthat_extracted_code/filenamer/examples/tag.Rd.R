library(filenamer)


### Name: tag
### Title: Insert tag or extension and coerce to character
### Aliases: tag

### ** Examples

x <- "data.txt"
y <- tag(x, "qc")
print(y)
f <- as.filename(x)
g <- tag(f, "qc")
print(g)



