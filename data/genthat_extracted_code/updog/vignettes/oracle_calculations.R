## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=4.5,
  fig.height=3.5
)

## ------------------------------------------------------------------------
bias   <- 0.7
od     <- 0.01
seq    <- 0.001
maxerr <- 0.05

## ---- message=FALSE------------------------------------------------------
library(updog)
ploidy <- 4
pgeno <- 2
gene_dist <- get_q_array(ploidy = ploidy)[pgeno + 1, pgeno + 1, ]

## ---- message=FALSE------------------------------------------------------
library(tidyverse)
data_frame(x = 0:ploidy, y = 0, yend = gene_dist) %>%
  ggplot(mapping = aes(x = x, y = y, xend = x, yend = yend)) +
  geom_segment(lineend = "round", lwd = 2) +
  theme_bw() +
  xlab("Allele Dosage") +
  ylab("Probability")

## ------------------------------------------------------------------------
err    <- Inf
depth  <- 0
while(err > maxerr) {
  depth <- depth + 1
  err <- oracle_mis(n = depth,
                    ploidy = ploidy,
                    seq = seq,
                    bias = bias,
                    od = od,
                    dist = gene_dist)
}
depth

## ------------------------------------------------------------------------
depth <- 30
jd <- oracle_joint(n = depth,
                   ploidy = ploidy,
                   seq = seq,
                   bias = bias,
                   od = od,
                   dist = gene_dist)
oracle_plot(jd)

## ---- echo=FALSE---------------------------------------------------------
omiss <- oracle_mis(n = depth,
                    ploidy = ploidy,
                    seq = seq,
                    bias = bias,
                    od = od,
                    dist = gene_dist)

ocorr <- oracle_cor(n = depth,
                    ploidy = ploidy,
                    seq = seq,
                    bias = bias,
                    od = od,
                    dist = gene_dist)

## ------------------------------------------------------------------------
ocorr <- oracle_cor(n = depth,
                    ploidy = ploidy,
                    seq = seq,
                    bias = bias,
                    od = od,
                    dist = gene_dist)
ocorr

