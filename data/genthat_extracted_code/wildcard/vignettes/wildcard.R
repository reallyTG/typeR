## ----wildcard------------------------------------------------------------
library(wildcard)
myths <- data.frame(
  myth = c("Bigfoot", "UFO", "Loch Ness Monster"), 
  claim = c("various", "day", "day"), 
  note = c("various", "pictures", "reported day"))
myths
wildcard(myths, wildcard = "day", values = c("today", "yesterday"))
wildcard(myths, wildcard = "day", values = c("today", "yesterday"),
  expand = FALSE)
wildcard(myths, wildcard = "day", values = c("today", "yesterday"),
  include = "claim")
wildcard(myths, wildcard = "day", values = c("today", "yesterday"),
  exclude = c("claim", "note"))
locations <- data.frame(
  myth = c("Bigfoot", "UFO", "Loch Ness Monster"),
  origin = "where")
rules <- list(
  where = c("North America", "various", "Scotland"),
  UFO = c("spaceship", "saucer"))
wildcard(locations, rules = rules, expand = c(FALSE, TRUE))
numbers <- data.frame(x = 4, y = 3, z = 4444, w = 4.434)
wildcard(numbers, wildcard = 4, values = 7)

## ----expandrows----------------------------------------------------------
df <- data.frame(
  ID = c("24601", "Javert", "Fantine"), 
  fate = c("fulfillment", "confusion", "misfortune"))
expandrows(df, n = 2, type = "each")
expandrows(df, n = 2, type = "times")

## ----nofactors-----------------------------------------------------------
class(iris$Species)
str(iris)
out <- nofactors(iris)
class(out$Species)
str(out)

