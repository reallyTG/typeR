## ---- echo = FALSE, message = FALSE--------------------------------------
# knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
knitr::opts_chunk$set(collapse = TRUE, comment = "")
library(cholera)

## ------------------------------------------------------------------------
head(roads)
nrow(roads)
length(unique(roads$street))

## ------------------------------------------------------------------------
# Map Border "Streets" #

top <- c(1:12, 14)
right <- c(37, 62, 74, 142, 147, 205, 240, 248, 280, 360, 405, 419, 465)
bottom <- c(483, seq(487, 495, 2), 498, 500, seq(503, 519, 2))
left <- c(31, 79, 114, 285, 348, 397, 469)
border <- sort(c(bottom, left, top, right))

length(border)


## ---- eval = FALSE-------------------------------------------------------
#  snow.streets <- HistData::Snow.streets
#  snow.streets$id <- seq_len(nrow(snow.streets))
#  
#  # Data frame of road names
#  road.data <- read.csv("~/Documents/Data IV/Snow/road3b.csv",
#    stringsAsFactors = FALSE)
#  
#  roads <- merge(snow.streets, road.data, by = "street", all.x = TRUE)
#  roads[is.na(roads$name), "name"] <- "Map Frame"
#  
#  roads[roads$id == 277, "street"] <- 116
#  roads[roads$id == 277, "name"] <- "Marlborough Mews"
#  roads[roads$id == 277, c("x", "y")] <- roads[roads$id == 276, c("x", "y")]
#  roads[roads$name == "Queen Street (I)", "n"] <- 4
#  roads[roads$name == "Marlborough Mews", "n"] <- 3
#  roads <- roads[order(roads$id), ]

## ---- echo = FALSE-------------------------------------------------------
road.names <- sort(unique(roads$name))
road.names <- road.names[road.names != "Map Frame"]
road.names <- stats::setNames(data.frame(matrix(road.names, ncol = 2)), NULL)
print(road.names, right = FALSE)

