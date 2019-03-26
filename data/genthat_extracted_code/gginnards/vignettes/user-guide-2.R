## ---- include=FALSE, echo=FALSE------------------------------------------
library(knitr)
opts_chunk$set(fig.path = 'figure2/', fig.align = 'center', 
               fig.show = 'hold', fig.width = 7, fig.height = 4)
options(warnPartialMatchArgs = FALSE)

## ------------------------------------------------------------------------
library(ggplot2)
library(gginnards)
library(tibble)
library(magrittr)
library(stringr)

## ------------------------------------------------------------------------
set.seed(4321)
# generate artificial data
my.data <- data.frame(
  group = factor(rep(letters[1:4], each = 30)),
  panel = factor(rep(LETTERS[1:2], each = 60)),
  y = rnorm(40),
  unused = "garbage"
)

## ------------------------------------------------------------------------
old_theme <- theme_set(theme_bw())

## ------------------------------------------------------------------------
p <- ggplot(my.data, aes(group, y)) + 
  geom_point() +
  stat_summary(fun.data = mean_se, colour = "red", size = 1.3) +
  facet_wrap(~panel, scales = "free_x", labeller = label_both)
p

## ------------------------------------------------------------------------
summary(p)

## ------------------------------------------------------------------------
names(p$layers)

## ------------------------------------------------------------------------
summary(p$layers)

## ------------------------------------------------------------------------
print(p$layers)

## ------------------------------------------------------------------------
str(p$layers[[1]])

## ------------------------------------------------------------------------
which_layers(p, "GeomPoint")
which_layers(p, "StatSummary")
which_layers(p, idx = 1L)

## ------------------------------------------------------------------------
extract_layers(p, "GeomPoint")

## ------------------------------------------------------------------------
delete_layers(p, "GeomPoint")

## ------------------------------------------------------------------------
delete_layers(p, idx = 1L)

## ------------------------------------------------------------------------
delete_layers(p, "StatSummary")

## ------------------------------------------------------------------------
move_layers(p, "GeomPoint", position = "top")

## ------------------------------------------------------------------------
shift_layers(p, "GeomPoint", shift = +1)

## ------------------------------------------------------------------------
append_layers(p, geom_line(colour = "orange", size = 1), position = "bottom")


## ------------------------------------------------------------------------
append_layers(p, object = geom_line(colour = "orange", size = 1), 
              position = which_layers(p, "GeomPoint"))

## ------------------------------------------------------------------------
p1 <- p + 
  annotate("text", label = "text label", x = 1.1, y = 0, hjust = 0)
p1

## ------------------------------------------------------------------------
delete_layers(p1, "GeomText")

## ----eval=FALSE----------------------------------------------------------
#  summary(theme_bw())

## ---- eval=FALSE---------------------------------------------------------
#  str(theme_bw())

## ------------------------------------------------------------------------
mapped.vars <- 
  gsub("[~*\\%^]", " ", as.character(p$mapping)) %>%
  str_split(boundary("word")) %>%
  unlist() %>%
  c(names(p$facet$params$facets))

## ------------------------------------------------------------------------
data.vars <- names(p$data)

## ------------------------------------------------------------------------
unused.vars <- setdiff(data.vars, c(mapped.vars))
keep.idxs <- which(!data.vars %in% unused.vars)

## ------------------------------------------------------------------------
p1 <- p
p1$data <- p$data[ , keep.idxs]

## ------------------------------------------------------------------------
object.size(my.data)
object.size(p)
object.size(p1)

## ------------------------------------------------------------------------
names(my.data)
names(p$data)
names(p1$data)

## ------------------------------------------------------------------------
p1

## ------------------------------------------------------------------------
drop_vars(p)

