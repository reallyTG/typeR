## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----include = TRUE------------------------------------------------------
library(QAIG)

## ----echo = TRUE---------------------------------------------------------
stem_text <- "What is the sum of first [N1] [C1] ?"

n1 <- c(5, 8, 11, 14, 17)
c1 <- c("natural numbers", "non-zero positive integers")

N <- list(n1 = n1)
C <- list(c1 = c1)

formulae <- "Option_A ? 2*n1-1
Option_B ? 3*n1-2
Option_C ~ n1*(n1+1)/2
Option_D ? n1*(n1-1)/2
"

## itemgen() function can be used as:
newitems <- QAIG::itemgen(stem_text = stem_text, formulae = formulae, N = N, C = C)

newitems

## ----include = TRUE------------------------------------------------------
library(QAIG)

## ----echo = TRUE---------------------------------------------------------
stem_text <- "[C1] has $ [N1] and [C2] has $ [N2] . If [C2] takes $ [N3] from [C1] later, then how much more amount than [C1] does [C3] have now?"

c1 <- c('Sam', 'Sean')
c2 <- c('Max', 'Martha', 'Mandy')
c3 <- c('he', 'she', 'she')

n1 <- c(4, 5, 6, 7)
n2 <- c(8, 9, 10)
n3 <- c(2, 3)

C <- list(c1 = c1, c2 = c2, c3 = c3)
N <- list(n1 = n1, n2 = n2, n3 = n3)

formulae <- "Option_A ? (n1 + n2)
Option_B ~ (n2 + 2*n3 - n1)
Option_C ? (n1 + n2 + 1)
Option_D ? (n1 + n2 - 2)
Option_E ? (n2 + n3 - n1)
"
options_affix <- list(Option_A = c('$ ', ''), Option_B = c('$ ', ''), Option_C = c('$ ', ''), Option_D = c('$ ', ''), Option_E = c('$ ', ''), Difficulty = 'EASY')

## itemgen() function can be used as:
newitems <- QAIG::itemgen(stem_text = stem_text, formulae = formulae, N = N, C = C, options_affix = options_affix)

newitems[, c(1, 4, 21, 24)]

## ----include = TRUE------------------------------------------------------
library(QAIG)

## ----echo = TRUE---------------------------------------------------------
stem_text <- "[C1] bought a [C2] at $ [N1] . [C3] spent $ [N2] for repairing it and then sold it at $ [N3] . What was [C4] percentage of profit or loss?"

c1 <- c('Samuel', 'April')
c2 <- c('motorcycle', 'moped')
c3 <- c('He', 'She')
c4 <- c('his', 'her')

n1 <- c(925, 862, 784)
n2 <- c(92, 102)
n3 <- 1030

C <- list(c1 = c1, c2 = c2, c3 = c3, c4 = c4)
N <- list(n1 = n1, n2 = n2, n3 = n3)

formulae <- "Option_A ? round((n2/n1)*100, 2)
Option_B ? round(((n3-n2-n1)/n3)*100, 1)
Option_C ? round(((n3-n2-n1+0)/n3)*100, 1)
Option_D ~ round((((n3-n2-n1)/(n1+n2))*100), 2)
"
options_affix <- list(Option_A = c('', '% loss'), Option_B = c('', '% profit'), Option_C = c('', '% loss'), Option_D = c('', '% profit'), Option_E = 'No profit no loss')

## itemgen() function can be used as:
newitems <- QAIG::itemgen(stem_text = stem_text, formulae = formulae, C = C, N = N, options_affix = options_affix)

newitems[, c(1, 2, 3, 6)]

## ----include = TRUE------------------------------------------------------
library(QAIG)

## ----echo = TRUE---------------------------------------------------------
stem_text <- "A [C1] was delayed somewhere for [N1] minutes but made up for the delay on a section of [N2] km travelling at a speed of [N3] km per hour higher than that which accorded the schedule. What was the speed of the [C1] that accorded the schedule?"

c1 <- c('car', 'bus', 'truck', 'train')

n1 <- c(16, 18, 20, 22, 24)
n2 <- c(80, 90, 100, 110)
n3 <- c(10, 12, 15, 18)

C <- list(c1 = c1)
N <- list(n1 = n1, n2 = n2, n3 = n3)

formulae <- "p <- 1
Option_A ? round((-n3 + sqrt(n3^2 - 4*p*(-60*n2*n3/n1)))/2,2)
Option_B ? round((-n3 - sqrt(n3^2 - 4*p*(-60*n2*n3/n1)))*(-1)/2-20,2)
Option_C ? round((-n3 - sqrt(n3^2 - 4*p*(-60*n2*n3/n1)))*(-1)/2,2)
Option_D ? round((-n3 + sqrt(n3^2 - 4*p*(-60*n2*n3/n1)))/2+30,2)
"
options_affix <- list(Option_A = c('', ' km/hr'), Option_B = c('', ' km/hr'), Option_C = c('', ' km/hr'), Option_D = c('', ' km/hr'), Option_E = 'Cannot be determined', Difficulty = 'HARD')

## itemgen() function can be used as:
newitems <- QAIG::itemgen(stem_text = stem_text, formulae = formulae, N = N, C = C, ans_key = 'Option_A', options_affix = options_affix)

newitems[, c(1, 2, 79, 80)]

## ----include = TRUE------------------------------------------------------
library(QAIG)

## ----echo = TRUE---------------------------------------------------------
stem_text <- "Sum of present ages of [C1] and [C2] [C3] is [N1] . After [N2] years [C2] [C3] will be thrice as old as [C1] . The present age of [C2] [C3] is"

n1 <- c(74, 80, 72, 68)
n2 <- c(8, 10)

c1 <- c('Sophia', 'Viktor', 'Julia', 'Andy')
c2 <- c('her', 'his')
c3 <- c('father', 'mother')

N <- list(n1 = n1, n2 = n2)
C <- list(c1 = c1, c2 = c2, c3 = c3)

formulae <- "a <- 5
sol <- function(x, y){
  A <- matrix(c(1, 1, 1, -3), nrow=2)
  B <- matrix(c(x, 2*y), nrow=2)
  return((as.matrix(solve(A)%*%B)))
}

Option_A ? round(sol(n1, n2)[1,]+a, 2)
Option_B ? round(sol(n1, n2)[2,]+a, 2)
Option_C ~ round(sol(n1, n2)[1,], 2)
Option_D ? round(sol(n1, n2)[2,], 2)
Option_E ? round(sol(n1, n2)[1,]-a, 2)
"
options_affix <- list(Option_A = c('', ' years'), Option_B = c('', ' years'), Option_C = c('', ' years'), Option_D = c('', ' years'), Option_E = c('', ' years'), Difficulty = 'MEDIUM')

## itemgen() function can be used as:
newitems <- QAIG::itemgen(stem_text = stem_text, formulae = formulae, N = N, C = C, options_affix = options_affix)
newitems[, c(1, 2, 7, 8)]

