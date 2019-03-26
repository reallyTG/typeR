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
package_db <- clean_CRAN_db(p_db)

## ------------------------------------------------------------------------
package_network <- build_network(package_db)
author_network <- build_network(package_db, perspective = "author")

## ------------------------------------------------------------------------
(glm_packages <- package_with(package_network, name = "glm"))

## ------------------------------------------------------------------------
plot(package_network, package = glm_packages)

## ------------------------------------------------------------------------
glm_package_only_network <- subset(package_network, package = glm_packages, only = TRUE)
plot(glm_package_only_network, package = glm_packages)

## ------------------------------------------------------------------------
glm_package_network <- subset(package_network, package = glm_packages)
glm_package_summaries <- summary(glm_package_network)
plot(glm_package_summaries, according_to = "n_imported_by")

## ------------------------------------------------------------------------
glm_author_network <- subset(author_network, package = glm_packages)
glm_author_summaries <- summary(glm_author_network)
plot(glm_author_summaries, according_to = "n_collaborators")

