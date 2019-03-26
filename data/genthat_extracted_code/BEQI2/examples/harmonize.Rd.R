library(BEQI2)


### Name: harmonize
### Title: Harmonize Case
### Aliases: harmonize

### ** Examples

x <- c("FOO", "Foo", "bar", "FOO", "bar", "FOO", "Bar")
 y <- BEQI2:::harmonize(x)
 stopifnot(all.equal(y, c("FOO", "FOO", "bar", "FOO", "bar", "FOO", "bar")))



