## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(cholera)
library(HistData)

## ---- fig.width = 5, fig.height = 5, fig.align = "center", echo = FALSE----
street.list <- split(Snow.streets[, c("x", "y")], Snow.streets$street)
plot(Snow.deaths$x, Snow.deaths$y, pch = 20, cex = 0.5,
  xlim = range(Snow.streets$x), ylim = range(Snow.streets$y),
  xlab = "x", ylab = "y", asp = 1)
invisible(lapply(street.list, lines, lwd = 0.75))
points(Snow.pumps$x, Snow.pumps$y, pch = 17, col = "blue")

## ------------------------------------------------------------------------
duplicates <- HistData::Snow.deaths[(duplicated(HistData::Snow.deaths[,
  c("x", "y")])), ]

duplicates.id <- lapply(duplicates$x, function(i) {
  HistData::Snow.deaths[HistData::Snow.deaths$x == i, "case"]
})

HistData::Snow.deaths[unlist(duplicates.id), ]

## ------------------------------------------------------------------------
fatalities <- HistData::Snow.deaths

fix <- data.frame(x = c(12.56974, 12.53617, 12.33145), y = c(11.51226, 11.58107, 14.80316))

fatalities[c(91, 93, 209), c("x", "y")] <- fix

