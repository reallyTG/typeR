## ---- cache = FALSE, include=FALSE---------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", 
                      fig.width = 6, fig.height = 4, fig.align = "center")

## ------------------------------------------------------------------------
library(quantities)

iris.q <- iris
for (i in 1:4)
  quantities(iris.q[,i]) <- list("cm", iris.q[,i] * 0.05)
head(iris.q)

## ---- eval=FALSE---------------------------------------------------------
#  rownames(installed.packages(priority="base"))

## ---- echo=FALSE---------------------------------------------------------
print(c("base", "compiler", "datasets", "graphics", "grDevices", "grid", "methods", "parallel", "splines", "stats", "stats4", "tcltk", "tools", "utils"))

## ------------------------------------------------------------------------
iris.q[which(iris.q$Sepal.Length > set_quantities(7.5, cm)), ]
subset(iris.q, Sepal.Length > set_quantities(7.5, cm))

## ------------------------------------------------------------------------
iris.q$Sepal.Length[1:5]
sort(iris.q$Sepal.Length[1:5])

## ------------------------------------------------------------------------
head(iris.q[order(iris.q$Sepal.Length), ])

## ------------------------------------------------------------------------
head(within(iris.q, {
  Sepal.Area <- Sepal.Length * Sepal.Width
  Petal.Area <- Petal.Length * Petal.Width
  rm(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
}))

## ------------------------------------------------------------------------
tapply(iris.q$Sepal.Length, iris.q$Species, mean)

## ------------------------------------------------------------------------
(sepal.length.agg <- 
   tapply(iris.q$Sepal.Length, iris.q$Species, mean, simplify=FALSE))

## ------------------------------------------------------------------------
# drops quantities
unlist(sepal.length.agg)

# preserves quantities
do.call(c, sepal.length.agg)

## ------------------------------------------------------------------------
(iris.q.agg <- aggregate(. ~ Species, data = iris.q, mean, simplify=FALSE))

## ------------------------------------------------------------------------
class(iris.q.agg$Sepal.Length)

## ------------------------------------------------------------------------
unlist_quantities <- function(x) {
  stopifnot(is.list(x) || is.data.frame(x))
  
  unlist <- function(x) {
    if (any(class(x[[1]]) %in% c("quantities", "units", "errors")))
      do.call(c, x)
    else x
  }
  
  if (is.data.frame(x))
    as.data.frame(lapply(x, unlist), col.names=colnames(x))
  else unlist(x)
}

unlist_quantities(iris.q.agg)

## ------------------------------------------------------------------------
unlist_quantities(sepal.length.agg)

## ------------------------------------------------------------------------
height <- data.frame(
  Height = set_quantities(c(55, 60, 45), cm, c(45, 30, 35)),
  Species = c("setosa", "virginica", "versicolor")
)

head(merge(iris.q, height))

## ------------------------------------------------------------------------
long.1 <- reshape(iris.q, varying=1:4, timevar="dim", idvar="dim.id", direction="long")
head(long.1)

## ------------------------------------------------------------------------
names(long.1)[3:4] <- paste0("value.", names(long.1)[3:4])
long.2 <- reshape(long.1, varying=3:4, timevar="part", idvar="part.id", direction="long")
head(long.2)

## ------------------------------------------------------------------------
wide.1 <- reshape(long.2, v.names="value", timevar="part", idvar="part.id", direction="wide")
head(wide.1)

## ------------------------------------------------------------------------
names(wide.1)[5:6] <- sub("value\\.", "", names(wide.1)[5:6])
wide.2 <- reshape(wide.1, v.names=c("Sepal", "Petal"), timevar="dim", idvar="dim.id", direction="wide")
wide.2$dim.id <- NULL
wide.2$part.id <- NULL
head(wide.2)

## ------------------------------------------------------------------------
all(sapply(colnames(iris.q), function(col) all(iris.q[[col]] == wide.2[[col]])))

## ---- cache = FALSE, include=FALSE---------------------------------------
required <- c("dplyr", "tidyr")

if (!all(sapply(required, requireNamespace, quietly = TRUE)))
  knitr::opts_chunk$set(eval = FALSE)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(dplyr); packageVersion("dplyr")
library(tidyr); packageVersion("tidyr")

## ------------------------------------------------------------------------
iris.q %>%
  filter(Sepal.Length > set_quantities(7.5, cm)) %>%
  head()

## ------------------------------------------------------------------------
iris.q %>%
  arrange(Sepal.Length) %>%
  head()

## ------------------------------------------------------------------------
iris.q %>%
  transmute(
    Species = Species,
    Petal.Area = Petal.Length * Petal.Width,
    Sepal.Area = Sepal.Length * Sepal.Width
  ) %>%
  head()

## ------------------------------------------------------------------------
iris.q %>%
  group_by(Species) %>%
  summarise_all(mean)

## ------------------------------------------------------------------------
iris.q %>%
  mutate_at(vars(-Species), drop_errors) %>%
  group_by(Species) %>%
  summarise_all(mean)

## ------------------------------------------------------------------------
iris.q %>%
  left_join(data.frame(
    Height = set_quantities(c(55, 60, 45), cm, c(45, 30, 35)),
    Species = c("setosa", "virginica", "versicolor")
  )) %>%
  head()

## ------------------------------------------------------------------------
iris.q %>%
  gather("key", "value", 1:4) %>%
  separate(key, c("part", "dim")) %>%
  head()

## ------------------------------------------------------------------------
wide <- iris %>%
  # first gather, with row numbers as row_id
  mutate(row_id = 1:n()) %>%
  gather("key", "value", 1:4) %>%
  separate(key, c("part", "dim")) %>%
  # assign quantities
  mutate(value = set_quantities(value, cm, value * 0.05)) %>%
  # now spread
  unite(key, part, dim, sep=".") %>%
  spread(key, value) %>%
  select(-row_id)

head(wide)

## ---- error=TRUE---------------------------------------------------------
all(sapply(colnames(iris.q), function(col) all(iris.q[[col]] == wide[[col]])))

length(errors(iris.q$Sepal.Length))
length(errors(wide$Sepal.Length))

