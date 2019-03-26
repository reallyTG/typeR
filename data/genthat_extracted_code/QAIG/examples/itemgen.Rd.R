library(QAIG)


### Name: itemgen
### Title: Automatic Item Generator for Quantitative Multiple-Choice Items
### Aliases: itemgen

### ** Examples

stem_text <- "The sum value of all the odd [C1] between [N1] and [N2] is"
n1 <- c(20, 24, 28, 32)
n2 <- c(48, 52, 56)
c1 <- c("natural numbers", "integers")
N <- list(n1 = n1, n2 = n2)
C <- list(c1 = c1)
formulae <- "Option_A ? sum((n1+1) : (n2-1))/2\n
Option_B ~ (length(seq(n1+1, n2-1, by = 2)))*(n1+n2)/2\n
Option_C ? sum(n1 : n2)/2\n
Option_D ? (length(seq(n1, n2, by = 2)))*(n1+n2)/2\n"

options_affix <- list(Option_A = c("", ""), Option_B = c("", ""), Option_C = c("", ""),
Option_D = c("", ""), Difficulty = "MEDIUM")

# itemgen() function can be used as:
itemgen(stem_text = stem_text, formulae = formulae, N = N, C = C, options_affix = options_affix)





