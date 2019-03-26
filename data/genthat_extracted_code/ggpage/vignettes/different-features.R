## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE------------------------------------------------------
library(magrittr)
library(dplyr)
library(ggpage)


book <- tinderbox %>%
  tidytext::unnest_tokens(text, text)

ggpage_build(book, para.fun = rpois, lambda = 75) %>%
  ggpage_plot()
ggpage_build(book, para.fun = rpois, lambda = 75) %>%
  ggpage_plot()
ggpage_build(book, para.fun = rpois, lambda = 500) %>%
  ggpage_plot()
ggpage_build(book, para.fun = rpois, lambda = 500) %>%
  ggpage_plot()

## ------------------------------------------------------------------------
ggpage_build(tinderbox) %>%
  ggpage_plot(paper.show = TRUE)

## ------------------------------------------------------------------------
ggpage_build(tinderbox) %>%
  ggpage_plot(paper.show = TRUE, paper.color = "pink")

## ------------------------------------------------------------------------
ggpage_build(tinderbox) %>%
  ggpage_plot(paper.show = TRUE, paper.color = rainbow(9), paper.alpha = 0.3)

## ------------------------------------------------------------------------
directions <- c("top", "top-right", "right", "bottom-right", "bottom",
                "bottom-left", "left", "top-left")
ggpage_build(tinderbox) %>%
  ggpage_plot(page.number = directions[1])
ggpage_build(tinderbox) %>%
  ggpage_plot(page.number = directions[2])
ggpage_build(tinderbox) %>%
  ggpage_plot(page.number = directions[3])
ggpage_build(tinderbox) %>%
  ggpage_plot(page.number = directions[4])
ggpage_build(tinderbox) %>%
  ggpage_plot(page.number = directions[5])
ggpage_build(tinderbox) %>%
  ggpage_plot(page.number = directions[6])
ggpage_build(tinderbox) %>%
  ggpage_plot(page.number = directions[7])
ggpage_build(tinderbox) %>%
  ggpage_plot(page.number = directions[8])


## ------------------------------------------------------------------------
tinderbox %>%
  mutate(short = ceiling(seq_len(nrow(tinderbox)) / 10)) %>%
  ggpage_build(page.col = "short", lpp = 10) %>%
  ggpage_plot()

## ------------------------------------------------------------------------
ggpage_build(tinderbox, align = "right") %>%
  ggpage_plot()

ggpage_build(tinderbox, align = "both") %>%
  ggpage_plot()

## ------------------------------------------------------------------------
nest_paragraphs(data = tinderbox_paragraph, input = text) %>%
  head()

nest_paragraphs(tinderbox_paragraph, text, width = 40) %>%
  head()

