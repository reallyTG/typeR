## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", message = FALSE, warning = FALSE, error = FALSE, tidy = FALSE, out.width = "100%"
)

## ----p1------------------------------------------------------------------
library(tabr)
phrase(notes = "r a2 c3 f3 d3 a3 f3", info = "4 8 8 8 8 8 8", string = "x 5 5 4 4 3 4")

## ----p2------------------------------------------------------------------
p1 <- p("r a2 c f d a f", "4 8*6")

## ----track---------------------------------------------------------------
track1 <- track(p1)
track1

## ----score---------------------------------------------------------------
song <- score(track1)
song

## ----opts----------------------------------------------------------------
# may not be necessary
# tabr_options(lilypond = "C:/Program Files (x86)/LilyPond/usr/bin/lilypond.exe")

## ----ex1, eval=FALSE-----------------------------------------------------
#  tab(song, "phrase.pdf", key = "dm", time = "4/4", tempo = "4 = 120")

## ----log, echo=FALSE-----------------------------------------------------
cat(
  "#### Engraving score to phrase.pdf ####",
  "GNU LilyPond 2.18.2",
  "Processing `./phrase.ly'",
  "Parsing...",
  "Interpreting music...",
  "Preprocessing graphical objects...",
  "Interpreting music...",
  "MIDI output to `./phrase.mid'...",
  "Finding the ideal number of pages...",
  "Fitting music on 1 page...",
  "Drawing systems...",
  "Layout output to `./phrase.ps'...",
  "Converting to `./phrase.pdf'...",
  "Success: compilation successfully completed", sep = "\n"
)

## ----pipe, results="hide", eval=FALSE------------------------------------
#  p("r a2 c f d a f", "4 8*6") %>% track %>% score %>%
#    tab(song, "phrase.pdf", key = "dm", time = "4/4", tempo = "4 = 120")

