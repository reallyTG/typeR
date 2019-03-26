## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align="center", 
  warning=FALSE, 
  message=FALSE, 
  idy.opts=list(width.cutoff=120))
library(alignfigR)
library(ggplot2)

## ----message=FALSE-------------------------------------------------------
require(alignfigR)
filename <- system.file("extdata", "example.fasta", package = "alignfigR")
my_data <- read_alignment(filename)

## ----basic_dna, message=FALSE,  fig.height=2.5, fig.width=5.5------------
p <- plot_alignment(my_data, "dna")
p

## ----titled_basic_dna, tidy=TRUE, tidy.opts=list(width.cutoff=120), echo=TRUE, fig.height=2.5, fig.width=5.5----
p + ggtitle("My fancy-schmancy alignment figure!") 

## ----dna_restrict_taxa, tidy=TRUE, tidy.opts=list(width.cutoff=120), fig.height=2.5, fig.width=5.5----
plot_alignment(my_data, "dna", taxa = c("Cow", "Carp"))

## ----dna_exclude_taxa, tidy=TRUE, tidy.opts=list(width.cutoff=120), fig.height=2.5, fig.width=5.5----
plot_alignment(my_data, "dna", taxa = c("Cow", "Carp"), exclude_taxa = T)

## ----dna_restrict_cols, tidy=TRUE, tidy.opts=list(width.cutoff=120), fig.height=2.5, fig.width=5.5----
plot_alignment(my_data, "dna", columns = c(1:25))

## ----dna_exclude_cols, tidy=TRUE, tidy.opts=list(width.cutoff=120), fig.height=2.5, fig.width=5.5----
plot_alignment(my_data, "dna", columns = c(1:200), exclude_columns = T)

## ----dna_colored_restrict_cols_taxa, tidy=TRUE, tidy.opts=list(width.cutoff=100), fig.height=2.5, fig.width=5.5----
exciting_colors <- c("A" = "turquoise", "C" = "maroon", "G" = "mediumpurple1", "T" = "royalblue4", "-" = "cornsilk1")
plot_alignment(my_data, exciting_colors, columns = c(1:200, 350:450), exclude_columns = T, taxa = c("Cow", "Carp", "Chicken", "Human") )

