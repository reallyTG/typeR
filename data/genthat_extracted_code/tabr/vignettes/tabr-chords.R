## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", message = FALSE, warning = FALSE, error = FALSE, tidy = TRUE, out.width = "100%"
)
library(tabr)

## ----chord1--------------------------------------------------------------
phrase("cegc'e' c3e3g3c4e4 cegc4e4", 4)

## ----tie-----------------------------------------------------------------
tie("c3e3g3c4e4")

## ----chord2--------------------------------------------------------------
chords <- "cegc'e' c3e3g3c4e4 cegc4e4"
phrase(chords, 4, "54321 54321 54321")
phrase(chords, 4, "5s*3")

## ----chord3--------------------------------------------------------------
chord_names <- c("d:m", "f", "g:m", "a")
chord_positions <- c("xxo231", "133211", "355333", "xo222o")

## ----chord4--------------------------------------------------------------
chords <- chord_set(chord_positions, chord_names)
chords

names(chord_positions) <- chord_names
identical(chords, chord_set(chord_positions))

## ----chord5, results="hide", eval=FALSE----------------------------------
#  p("r", 1) %>% track %>% score(chords) %>% tab("ex13.pdf")

## ----chord6, results="hide", eval=FALSE----------------------------------
#  chords <- c("xo22oo", "xo223o", "xxx565", "xxx786", "xx(10)(10)(10)8", "xxo231", "xxx765", "xxo22oo", NA, NA)
#  names(chords) <- c("a:sus2", "a:sus4", "f/c", "g:m/d", "f", "d:m", "d:m", "a:sus2", "r", "s")
#  chords <- chord_set(chords)
#  p("r", 1) %>% track %>% score(chords) %>% tab("ex14.pdf")

## ----chord7, results="hide", eval=FALSE----------------------------------
#  notes <- "c e g c' e' c' g e g b d' g' f a c' f' c e g e c"
#  info <- c("8*20 2", "4*20 1")
#  strings <- glue(c(5:1, 2:4, 4:1, 4:1, 5:3, 4:5)) # almost not needed, but for 1st 2 notes of G chord
#  p1 <- p(notes, info[1], strings)
#  p2 <- p(notes, info[2], strings)
#  chords <- chord_set(c(c = "x32o1o", f = "xx3211", g = "xx5433", r = NA, s = NA))

## ----chord8, results="hide", eval=FALSE----------------------------------
#  chord_seq <- c(1, 2, 2, 1)
#  names(chord_seq) <- names(chords)[c(1, 3:1)] # C G F C
#  track(p1) %>% score(chords, chord_seq) %>% tab("ex15.pdf")

## ----chord9, results="hide", eval=FALSE----------------------------------
#  chord_seq <- rep(1, 6)
#  names(chord_seq) <- names(chords)[c(1, 5, 3:1, 4)] # C (s) G F C (r)
#  track(p2) %>% score(chords, chord_seq) %>% tab("ex16.pdf")

## ----cleanup, echo=FALSE-------------------------------------------------
unlink("*.mid")

