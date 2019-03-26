## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 6
)

## ------------------------------------------------------------------------
library("cranly")
p_db <- tools::CRAN_package_db()

## ------------------------------------------------------------------------
package_db <- clean_CRAN_db(p_db)

## ------------------------------------------------------------------------
attr(package_db, "timestamp")

## ------------------------------------------------------------------------
package_network <- build_network(package_db)

## ------------------------------------------------------------------------
## Global package network statistics
package_summaries <- summary(package_network)

## ------------------------------------------------------------------------
plot(package_summaries, according_to = "n_imported_by", top = 20)
plot(package_summaries, according_to = "page_rank", top = 20)
plot(package_summaries, according_to = "betweenness", top = 20)
plot(package_summaries, according_to = "n_enhances", top = 20)
plot(package_summaries, according_to = "n_authors", top = 20)
plot(package_summaries, according_to = "n_imports", top = 20)

## ------------------------------------------------------------------------
my_packages <- package_by(package_network, "Ioannis Kosmidis")
my_packages

## ------------------------------------------------------------------------
plot(package_network, package = my_packages, title = TRUE, legend = TRUE)

## ------------------------------------------------------------------------
optional_packages <- subset(package_network, recommended = FALSE, base = FALSE)
optional_summary <- summary(optional_packages)
plot(optional_summary, top = 30, according_to = "n_imported_by")

## ------------------------------------------------------------------------
author_network <- build_network(object = package_db, perspective = "author")

## ------------------------------------------------------------------------
author_summaries <- summary(author_network)

## ------------------------------------------------------------------------
plot(author_summaries, according_to = "n_packages", top = 20)
plot(author_summaries, according_to = "page_rank", top = 20)
plot(author_summaries, according_to = "betweenness", top = 20)

## ------------------------------------------------------------------------
plot(author_network, author = "R Core")

## ------------------------------------------------------------------------
plot(author_network, author = "Kosmidis", exact = FALSE)

