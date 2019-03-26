## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", message = FALSE, warning = FALSE, error = FALSE, tidy = TRUE, out.width = "100%"
)
library(tabr)

## ----join----------------------------------------------------------------
glue("c3 d3 e3", "f3 g3 a3")
dup("c3 d3 e3", 2)

## ----rest----------------------------------------------------------------
"r8 r8 r8 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r4."
glue(dup("r8", 3), dup("r1", 10), "r4.")
rest(c(8, 1, "4."), c(3, 10, 1))
"r8*3 r1*10 r4."

## ----tie-----------------------------------------------------------------
em <- "e,a,dgbe'"
tie(em)

## ----hp1-----------------------------------------------------------------
hp("16 16")
hp("16", "16")
hp(16, 16, 8, "2.")

## ----hp2-----------------------------------------------------------------
hp(dup("16 8", 8))

## ----tp1-----------------------------------------------------------------
notes1 <- "c3 b2 c3 d3 e3 e3 d3 c3 b2 c3 c3 c4"
notes2 <- "c4 b c4 d4 e4 e4 d4 c4 b c4 c4 c5"
transpose(notes1, 12) == notes2

## ----tp2-----------------------------------------------------------------
transpose("a_3 b_4 c5", 0)
tp("a_3 b_4 c5", -1)
tp("a_3 b_4 c5", 1)
tp("a#3 b4 c#5", 11)
tp("a#3 b4 c#5", 12)
tp("a#3 b4 c#5", 13)

## ----tp3-----------------------------------------------------------------
tp("a3 b4 c5", 2, key = "f")
tp("a3 b4 c5", 2, key = "g", style = "tick")
tp("a b' c''", 2, key = "flat")
tp("a, b c'", 2, key = "sharp", style = "integer")

## ----tuplet1-------------------------------------------------------------
x <- "c4 d4 e4"
tuplet(x, 8)
triplet(x, 8) # equivalent
tuplet(dup(x, 2), 8, a = 6, b = 4) # 6 notes per 4 beats
tuplet(dup(x, 4), 8) # multiple tuplets, one call

## ----tuplet2, results="hide", eval=FALSE---------------------------------
#  p1 <- glue(triplet("c4 r e4", 8, "4 3 3"),
#             tuplet("f4 g4 a4 b4 c5 b4", 8, "3 2 2 1 1 1", 6, 4),
#             tuplet("a4 r f4 g4 r e4 f4 e4 d4 e4 d4 c4", 16, "2 2 3 2 3*7 4"),
#             tuplet("b a g f e", 16, "4 4 5*3", 5, 4))
#  track(glue(p1, p("d c", "8 4.", "6 6"))) %>% score %>% tab("ex12.pdf")

## ----cleanup, echo=FALSE-------------------------------------------------
unlink("*.mid")

