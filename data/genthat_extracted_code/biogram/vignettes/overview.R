## ---- echo = FALSE, message = FALSE, results='asis'----------------------
library(knitr)
opts_chunk$set(fig.width=7, fig.height=6)

library(biogram)

library(ggplot2)

size_mod <- -5

my_theme <- theme(plot.background=element_rect(fill = "transparent",
                                               colour = "transparent"),
                  panel.grid.major = element_line(colour="lightgrey", linetype = "dashed", size = 0.5),
                  panel.background = element_rect(fill = "transparent",colour = "black"),
                  legend.background = element_rect(fill = "NA"),
                  legend.position = "bottom",
                  axis.text = element_text(size=13 + size_mod),
                  axis.title.x = element_text(size=16 + size_mod, vjust = -1), 
                  axis.title.y = element_text(size=16 + size_mod, vjust = 1),
                  strip.text = element_text(size=17 + size_mod, face = "bold"),
                  legend.text = element_text(size=13 + size_mod), 
                  legend.title = element_text(size=17 + size_mod),
                  plot.title = element_text(size=20 + size_mod),
                  strip.background = element_rect(fill = "NA", colour = "NA"))


## ---- echo = FALSE, message = FALSE, results='asis'----------------------
group2df <- function(group_list, caption = NULL, label = NULL) {
  data.frame(ID = 1L:length(group_list), 
             Groups = sapply(group_list, function(i)
    paste0(toupper(sort(i)), collapse = ", ")))
}

a <- list(`1` = "p", 
          `2` = c("f", "i", "w", "y"), 
          `3` = c("a", "c", "d", "e", "g", "h", "k", "l", "m", "n", "q", "r", "s", "t", "v"))

kable(group2df(a), caption = "Encoding A")

## ---- echo = FALSE, message = FALSE, results='asis'----------------------
b <- list(`1` = c("f", "r", "w", "y"), 
          `2` = c("c", "i", "l", "t", "v"), 
          `3` = c("a", "d", "e", "g", "h", "k", "m", "n", "p", "q", "s"))

kable(group2df(b), caption = "Encoding B")

## ---- echo = FALSE, message = FALSE, results='asis'----------------------
data(aaprop)
a_prop <- aaprop[c(22, 211), ]

#b_prop <- aa_nprop[na.omit(traits_table[ao, ]), , drop = FALSE]

# must have unified lists of features

coords_a <- lapply(a, function(single_subgroup) rowMeans(a_prop[, single_subgroup, drop = FALSE]))
coords_b <- lapply(b, function(single_subgroup) rowMeans(a_prop[, single_subgroup, drop = FALSE]))

dat_a <- data.frame(enc = "a", do.call(rbind, coords_a), label = paste0("A", 1L:3))
dat_b <- data.frame(enc = "b", do.call(rbind, coords_b), label = paste0("B", 1L:3))

dat <- data.frame(do.call(rbind, lapply(1L:nrow(dat_a), function(id) 
  data.frame(id = id, rbind(do.call(rbind, lapply(1L:3, function(dummy) 
    dat_a[id, , drop = FALSE])),
    dat_b)))), pair = c(paste0("d", 1L:3), paste0("d", 1L:3)))

colnames(dat) <- c("id", "enc", "f1", "f2", "label", "pair")
dat[["id"]] <- paste0("Encoding a\nsubgroup ", dat[["id"]])


ggplot(dat, aes(x = f1, y = f2, colour = pair, label = label)) +
  geom_line() +
  geom_point(aes(x = f1, y = f2, colour = enc), size = 4) + 
  facet_wrap(~ id) + 
  geom_text(aes(x = f1, y = f2, colour = enc, label = label), vjust = 1.8, size = 4) + 
  scale_color_brewer(palette="Dark2", guide = "none") +
  my_theme

## ---- echo = FALSE, message = FALSE, results='asis'----------------------
tmp <- sapply(coords_a, function(single_coords_a) {
  distances <- sapply(coords_b, function(single_coords_b) 
    #vector of distances between groups
    sqrt(sum((single_coords_a - single_coords_b)^2))
  )
  #c(dist = min(distances), id = unname(which.min(distances)))
  distances
})

colnames(tmp) <- paste0("Enc a, group ", colnames(tmp))
rownames(tmp) <- paste0("Enc b, group ", rownames(tmp))

kable(tmp, caption = "Distances between groups of encodings a and b.")

## ---- echo = TRUE--------------------------------------------------------

# define two encodings
a <- list(`1` = "p", 
          `2` = c("f", "i", "w", "y"), 
          `3` = c("a", "c", "d", "e", "g", "h", "k", "l", "m", "n", "q", "r", "s", "t", "v"))

b <- list(`1` = c("f", "r", "w", "y"), 
          `2` = c("c", "i", "l", "t", "v"), 
          `3` = c("a", "d", "e", "g", "h", "k", "m", "n", "p", "q", "s"))

# calculate encoding distance
calc_ed(a = a, b = b, measure = "pi")

# get properties from aaprop dataset and calculate normalized encoding distance
data(aaprop)
calc_ed(a = a, b = b, measure = "pi", prop = aaprop[c(22, 211), ])

