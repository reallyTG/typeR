## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", message = FALSE, warning = FALSE, error = FALSE, tidy = TRUE, out.width = "100%"
)
library(tabr)

## ----syntax, echo=FALSE--------------------------------------------------
x <- tabrSyntax
x$syntax <- gsub("\\-", "\\\\-", gsub("\\*", "\\\\*", x$syntax))
x$example <- gsub("\\*", "\\\\*", x$example)
x %>% knitr::kable("html", escape = TRUE, align = "c", caption = "tabr::tabrSyntax") %>%
  kableExtra::kable_styling(bootstrap_options = c("striped", "condensed"), position = "float_right", full_width = FALSE)

## ----p0------------------------------------------------------------------
phrase("c1 c2 c3 c4 c5", "1 1 1 1 1")
phrase("c,, c, c c' c''", "1*5")

## ----p1, results="hide", eval=FALSE--------------------------------------
#  phrase("c3 d3 e3 f3 g3 a3 b3 c4 b3 c4", "16 16 8 8 4 4 8 2 2 1") %>% track %>% score %>% tab("ex01.pdf")

## ----p2, results="hide", eval=FALSE--------------------------------------
#  phrase("r d3 e3 r g3 r b3 r b3 r", "16 16 8 8 4 4 8 2 2 1") %>% track %>% score %>% tab("ex02.pdf")

## ----p3, results="hide", eval=FALSE--------------------------------------
#  phrase("r a2 b2 c3~ c3", "2 8 8 4 1") %>% track %>% score %>% tab("ex03.pdf")

## ----p4, results="hide", eval=FALSE--------------------------------------
#  notes <- "c3 d3 e3 f3 g3 a3 b3 c4 b3 c4"
#  info <- "16 16 8 8 4 4 8 2 2 1"
#  strings <- "6 6 5 5 5 4 4 4 4 4"
#  phrase(notes, info, strings) %>% track %>% score %>% tab("ex04.pdf")

## ----p5, results="hide", eval=FALSE--------------------------------------
#  phrase("c3 d3 e3 e3 e3 d3 c3", "4. 4. 8 8 2.. 8 1") %>% track %>% score %>% tab("ex05.pdf")

## ----p6, results="hide", eval=FALSE--------------------------------------
#  phrase("c3 e3 g3 e3 c3", "8] 8] 8] 8] 2") %>% track %>% score %>% tab("ex06.pdf")

## ----p7, results="hide", eval=FALSE--------------------------------------
#  phrase("c3 e3 g3 e3 c3", "8x] 8x] 8x] 8x] 2x") %>% track %>% score %>% tab("ex07.pdf")

## ----p8, results="hide", eval=FALSE--------------------------------------
#  phrase("c3 b2 c3 d3 e3 e3 d3 c3 b2 c3 c3 c4", "8- 8- 4 8- 8 8- 8 8- 8- 8 4.- 4", "5*12") %>% track %>% score %>% tab("ex08.pdf")

## ----p9, results="hide", eval=FALSE--------------------------------------
#  notes <- glue("c3 b2 c3 d3 e3 e3 d3 c3 b2 c3 c3 c4", "c4 b3 c4 d4 e4 e4 d4 c4 b3 c4 c4 c5")
#  info <- dup("8( 8)( 4) 8( 8) 8( 8) 8 8( 8) 4.- 4", 2)
#  strings <- "5*12 3*12"
#  phrase(notes, info, strings) %>% track %>% score %>% tab("ex09.pdf")

## ----p10, results="hide", eval=FALSE-------------------------------------
#  notes <- glue("r a2 c3 f3 d3 a3 f3 b3~ b3~ b3", "r a3 c4 d4 a3 f4 d4 g4~ g4~ g4")
#  info <- dup("4 8 8 8 8 8 8 16^ 16 2..^", 2)
#  strings <- glue("x 5 5 4 4 3 4 3 3 3", "x 4 3 3 4 2 3 2 2 2")
#  phrase(notes, info, strings) %>% track %>% score %>% tab("ex10.pdf")

## ----p11, results="hide", eval=FALSE-------------------------------------
#  p1 <- phrase("c cegc'e' c3 c3e3g3c4e4", "4*4", "5 54321 5 5s")
#  track(p1) %>% score %>% tab("ex11.pdf")

## ----cleanup, echo=FALSE-------------------------------------------------
unlink("*.mid")

