## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----loadpkg-------------------------------------------------------------
# load helixvis
library("helixvis")

# load dataset containing example peptides
data("sequence")

## ----wheel, fig.width = 4, fig.height = 4--------------------------------
# print sequence that will be drawn
print(sequence[1, ])

# draw helical wheel
draw_wheel(sequence$Seq[1])

## ----wheelcol, fig.width = 4, fig.height = 4-----------------------------
# draw helical wheel with custom color scheme
draw_wheel(sequence$Seq[1], col = c("pink", "orange", "white", "black"),
           labels = TRUE, label.col = "blue")

## ----wenxiang, fig.width = 4, fig.height = 4-----------------------------
# draw wenxiang diagram
draw_wenxiang(sequence$Seq[1])

# draw wenxiang diagram with custom color scheme
draw_wenxiang(sequence$Seq[1], col = c("pink", "orange", "white", "black"),
           labels = TRUE, label.col = "blue")

