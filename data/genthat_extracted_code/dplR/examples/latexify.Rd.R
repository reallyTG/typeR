library(dplR)


### Name: latexify
### Title: Convert Character Strings for Use with LaTeX
### Aliases: latexify
### Keywords: utilities

### ** Examples

x1 <- "clich\xe9\nma\xf1ana"
Encoding(x1) <- "latin1"
x1
x2 <- x1
Encoding(x2) <- "bytes"
x2
x3 <- enc2utf8(x1)
testStrings <-
    c("different     kinds\nof\tspace",
      "control\a characters \ftoo",
      "{braces} and \\backslash",
      '#various$ %other^ &characters_ ~escaped"/coded',
      x1,
      x2,
      x3)
latexStrings <- latexify(testStrings, doublebackslash = FALSE)
## All should be "unknown"
Encoding(latexStrings)
cat(latexStrings, sep="\n")
## Input encoding does not matter
identical(latexStrings[5], latexStrings[7])



