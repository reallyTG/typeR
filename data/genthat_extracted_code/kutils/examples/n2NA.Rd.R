library(kutils)


### Name: n2NA
### Title: Convert nothing to R missing(NA).
### Aliases: n2NA

### ** Examples

gg <- c("", " ", "   ", "\t", "\t some", "some\t", " space first", ".",
       " . ")
n2NA(x = gg)
n2NA(x = gg, zapspace = FALSE)
n2NA(x = gg, nothings = c("\\s"), zapspace = FALSE)
n2NA(x = gg, nothings = c("\\."), zapspace = TRUE)
n2NA(x = gg, nothings = c("\\."), zapspace = FALSE)



