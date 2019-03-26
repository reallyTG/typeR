## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE, screenshot.force = FALSE)

## ------------------------------------------------------------------------
library(configr)
library(BioInstaller)
blast.databases <- system.file('extdata', 
  'config/db/db_blast.toml', package = 'BioInstaller')

read.config(blast.databases)$db_blast_nr$source_url
x <- read.config(blast.databases, glue.parse = TRUE)$db_blast_nr$source_url
length(x)
head(x)
mask.github <- tempfile()
file.create(mask.github)
install.bioinfo(nongithub.cfg = blast.databases, github.cfg = mask.github,
  show.all.names = TRUE)

