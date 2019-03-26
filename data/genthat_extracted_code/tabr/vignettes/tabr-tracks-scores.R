## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", message = FALSE, warning = FALSE, error = FALSE, tidy = TRUE, out.width = "100%"
)

## ----intro---------------------------------------------------------------
library(tabr)
p1 <- p("c e g c' e' c' g e", 8, "5 4 3 2 1 2 3 4")
p2 <- p("g b d' g'", 8, "4 3 2 1")
p3 <- p("f a c' f'", 8, "4 3 2 1")
p4 <- p("c e g e c", "8*4 2", "5 4 3 4 5")
p_all <- glue(p1, p2, p3, p4)
track(p_all) %>% score

## ----track1--------------------------------------------------------------
track(p_all, music_staff = NA)

## ----track2--------------------------------------------------------------
t1 <- track(p_all, ms_transpose = 2)
t2 <- track(p_all, ms_transpose = 2, ms_key = "d")
t1
t2

## ----track2b, results="hide", eval=FALSE---------------------------------
#  score(t2) %>% tab("ex22.pdf")

## ----track3--------------------------------------------------------------
p_all2 <- p("c5 d5 e5 f5 g5", "1 2 4 4 1", "1*5")
t1 <- track(p_all2, voice = 1)
t2 <- track(p_all, voice = 2)
trackbind(t1, t2)

## ----track3b-------------------------------------------------------------
t_all <- trackbind(t1, t2, tabstaff = c(1, 1))
t_all

## ----track3c, results="hide", eval=FALSE---------------------------------
#  score(t_all) %>% tab("ex23.pdf")

## ----track4--------------------------------------------------------------
t1 <- track(p_all2)
t2 <- track(p_all)
trackbind(t1, t2)

## ----track4b, results="hide", eval=FALSE---------------------------------
#  trackbind(t1, t2) %>% score %>% tab("ex24.pdf")

## ----track5--------------------------------------------------------------
t1 <- track(p_all2, voice = 1)
t2 <- track(p_all, voice = 2)
t3 <- track(p("ce*4 g,*2 f,*2 ce*3", "4*10 2", "54*4 6*4 54*3"), music_staff = NA)
t_all <- trackbind(t1, t2, t3, tabstaff = c(1, 1, 2))
t_all

## ----track5b, results="hide", eval=FALSE---------------------------------
#  score(t_all) %>% tab("ex25.pdf")

## ----track6--------------------------------------------------------------
p1 <- p("e, b, e g b e'", 8)
t1 <- track(p1)
t2 <- track(p1, tuning = "dropD")
t3 <- track(p1, tuning = "dropC")

## ----track6b, echo=FALSE, results="hide", eval=FALSE---------------------
#  score(t1) %>% tab("ex26a.pdf")
#  score(t2) %>% tab("ex26b.pdf")
#  score(t3) %>% tab("ex26c.pdf")

## ----track7, results="hide", eval=FALSE----------------------------------
#  track(p1, music_staff = "bass_8") %>% score %>% tab("ex27.pdf")

## ----track8--------------------------------------------------------------
t1 <- track(rp(p_all2, 2), voice = 1)
t2 <- track(rp(p_all, 2), voice = 2)
t3 <- track(rp(p("c2e2*4 g1*2 f1*2 c2e2*3", "4*10 2", "32*4 4*4 32*3"), 2), tuning = "bass", music_staff = "bass_8")
t_all <- trackbind(t1, t2, t3, tabstaff = c(1, 1, 2))
t_all

## ----track8b, results="hide", eval=FALSE---------------------------------
#  score(t_all) %>% tab("ex28.pdf")

## ----track9--------------------------------------------------------------
chords <- chord_set(c(c = "x32o1o", g = "355433", f = "133211"))
chord_seq <- rep(setNames(c(1, 2, 2, 1), names(chords)[c(1:3, 1)]), 3)
chords
chord_seq

## ----track9b, results="hide", eval=FALSE---------------------------------
#  score(t_all, chords = chords) %>% tab("ex29.pdf")

## ----track10, results="hide", eval=FALSE---------------------------------
#  score(t_all, chord_seq = chord_seq) %>% tab("ex30.pdf")

## ----track11, results="hide", eval=FALSE---------------------------------
#  score(t_all, chords, chord_seq) %>% tab("ex31.pdf")

## ----cleanup, echo=FALSE-------------------------------------------------
unlink("*.mid")

