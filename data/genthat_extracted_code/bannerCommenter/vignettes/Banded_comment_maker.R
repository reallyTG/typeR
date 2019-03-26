## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(comment = "", echo = FALSE)
library(bannerCommenter)

## ------------------------------------------------------------------------
section("Section 1", "Data input and initialization")

## ------------------------------------------------------------------------
boxup("Primary data input", bandChar = "-", center = TRUE)

## ------------------------------------------------------------------------
open_box("Some minor glitches in the data\nneed special treatment here", 
      bandChar = ".", snug = TRUE)

## ---- echo = TRUE--------------------------------------------------------
library(bannerCommenter)
banner("Section 1:", "Data input and initialization", emph = TRUE)

## ---- results = "asis"---------------------------------------------------
txt <- structure(c("`x, ...`", "",
                   "`emph`", 
                   "`snug`", 
                   "`upper`", 
                   "`centre`", 
                   "`leftSideHashes`", 
                   "`rightSideHashes`",
                   "`minHashes`", 
                   "`numLines`", 
                   "`bandChar`", 
                   "`center`", 
                   "One or more strings, which may be missing.", 
                   "(Single strings may be further broken by '`\\n`'.)",
                   "Do you want emphasis, i.e. a bigger, bolder banner?", 
                   "Do you want any box to be close fitting?", 
                   "Do you want the text to be in upper case?", 
                   "Do you want the text lines to be centred?", 
                   "How many hash characters to the left?", 
                   "How many hash characters to the right", 
                   "How long do you want the bands (at least)?", 
                   "How many lines above and below do you want?", 
                   "What character do you want to use for the bands?", 
                   "Foreign, alternative spelling of '`centre`'", 
                   "`<none>`", "",
                   "`FALSE`", 
                   "`FALSE`", 
                   "`emph`", 
                   "`!snug && emph`", 
                   "`2 + emph`", 
                   "`leftSideHashes`", 
                   "`(!snug) * (65 + 10 * emph)`", 
                   "`1 + emph`", 
                   "`\"#\"`", 
                   "`centre`"), 
                 .Dim = c(12L, 3L), 
                 .Dimnames = list(NULL, c("Argument", "Meaning", "Default")))
knitr::kable(txt)

## ---- echo = TRUE--------------------------------------------------------
txt <- "This is the text of a comment"
banner(txt)  ## default heavy style

banner(txt, centre = TRUE, bandChar = "-")

boxup(txt, snug = TRUE, bandChar = "=")

open_box(txt, bandChar = ":")

block("This is a chatty comment.  Entering it this way just",
      "saves a tiny bit of typing but it can be useful if",
      "you need multiple initial hash marks, as you may when",
      "using Emacs/ESS, for example.",
      "Or if you want the lines centred for some odd reason.",
      center = TRUE)

boxup("")  ## short lines of uniform length, for use as a separator

section("")  ## heavier, longer double lines to separate bigger things

## ---- eval = FALSE, echo = TRUE------------------------------------------
#  copy_to_clipboard(txt)

## ---- eval=FALSE, echo = TRUE, message = FALSE---------------------------
#  library(dplyr)
#  mtcarsText <- datasets::mtcars   %>%
#    capture.output(write.table(.)) %>%
#    copy_to_clipboard(sep = "\n")

