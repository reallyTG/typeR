## ---- echo = FALSE-------------------------------------------------------
# Grab package version and date from DESCRIPTION file.
pkgVersion <- packageDescription("seroincidence")$Version
pkgDate <- packageDescription("seroincidence")$Date
pkgBaseFileName <- paste("seroincidence", pkgVersion, sep = "_")
pkgUrl <- gsub("\n", "", packageDescription("seroincidence")$URL)
pkgPath <- "http://ecdc.europa.eu/en/data-tools/seroincidence-calculator-tool/Documents"
library("knitr")

## ----echo=FALSE, fig.pos="!h", fig.align='center'------------------------
include_graphics("fig/setup1.png")

## ----echo=FALSE, fig.pos="!h", fig.align='center'------------------------
include_graphics("fig/setup2.png")

## ----echo=FALSE, fig.pos="!h", fig.align='center'------------------------
include_graphics("fig/setup3.png")

## ----echo=FALSE, fig.pos="!h", fig.align='center'------------------------
include_graphics("fig/setup4.png")

## ----echo=FALSE, fig.pos="!h", fig.align='center'------------------------
include_graphics("fig/RGui1.png")

## ----echo=FALSE, fig.pos="!h", fig.align='center'------------------------
include_graphics("fig/RGui2.png")

## ----echo=FALSE, fig.pos="!h", fig.align='center'------------------------
include_graphics("fig/RGui3.png")

## ----echo=FALSE, fig.pos="!h", fig.align='center'------------------------
include_graphics("fig/RGui4.png")

## ---- include=FALSE, tidy=FALSE------------------------------------------
chunkTemplate <- "```{r, eval = FALSE}
# OPTION A
# Install Windows binary package \"seroincidence\" directly from internet ECDC website:
install.packages(
    pkgs = \"{{pkgPath}}/
                {{pkgBaseFileName}}.zip\",
    repos = NULL, type = \"win.binary\")

# OPTION B
# Install source package directly from internet CRAN repository:
install.packages(\"seroincidence\")

# OPTION C
# Install Windows binary package from a local file:
#   install.packages(\"[PATH/TO/FILE/]seroincidence_[version].zip\", 
#                       repos = NULL, type = \"win.binary\")
# For instance:
install.packages(pkgs = \"C:/{{pkgBaseFileName}}.zip\", repos = NULL, type = \"win.binary\")

# OPTION D
# Install source package from a local file:
install.packages(pkgs = \"C:/{{pkgBaseFileName}}.tar.gz\", repos = NULL, type = \"source\")
```"
chunkSource <- knit_expand(text = chunkTemplate, pkgBaseFileName = pkgBaseFileName)

## ---- eval=FALSE---------------------------------------------------------
## # Load package "seroincidence".
## library(seroincidence)
## 
## # Show R help for the package.
## ?seroincidence
## 
## # Show tutorial for the package.
## vignette(topic = "tutorial", package = "seroincidence")

## ------------------------------------------------------------------------
# Show description.
packageDescription("seroincidence")

# Show citation.
citation("seroincidence")

