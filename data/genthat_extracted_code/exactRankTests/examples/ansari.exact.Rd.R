library(exactRankTests)


### Name: ansari.exact
### Title: Ansari-Bradley Test
### Aliases: ansari.exact ansari.exact.default ansari.exact.formula
### Keywords: htest

### ** Examples

## Hollander & Wolfe (1973, p. 86f):
## Serum iron determination using Hyland control sera
ramsay <- c(111, 107, 100, 99, 102, 106, 109, 108, 104, 99,
            101, 96, 97, 102, 107, 113, 116, 113, 110, 98)
jung.parekh <- c(107, 108, 106, 98, 105, 103, 110, 105, 104,
            100, 96, 108, 103, 104, 114, 114, 113, 108, 106, 99)
ansari.test(ramsay, jung.parekh)
ansari.exact(ramsay, jung.parekh)

ansari.exact(rnorm(20), rnorm(20, 0, 2), conf.int = TRUE)



