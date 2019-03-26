## ----setup, include=FALSE, echo=TRUE, message=FALSE----------------------
library(plotly)
#library(manhattanly)
library(knitr)
knitr::opts_chunk$set(echo = TRUE, 
                      tidy = FALSE, 
                      cache = FALSE, 
                      warning = FALSE,
                      message = FALSE)#,
                      # dpi = 60)
                      #comment = "#>")
#knitr::opts_knit$set(eval.after = 'fig.cap')

## ---- message=TRUE-------------------------------------------------------
# load the manhattanly library
library(manhattanly)

head(HapMap)

dim(HapMap)

## ------------------------------------------------------------------------
manhattanly(subset(HapMap, CHR %in% 4:7), snp = "SNP", gene = "GENE")

## ------------------------------------------------------------------------
qqly(subset(HapMap, CHR %in% 4:7), snp = "SNP", gene = "GENE")

## ---- eval=FALSE---------------------------------------------------------
#  volcanoly(subset(HapMap, CHR %in% 4:7), snp = "SNP", gene = "GENE")

## ---- eval = TRUE--------------------------------------------------------
manhattanly(subset(HapMap, CHR %in% 4:7), snp = "SNP", gene = "GENE", highlight = significantSNP)

## ---- eval = TRUE--------------------------------------------------------
manhattanly(subset(HapMap, CHR %in% 4:7), snp = "SNP", gene = "GENE",
            annotation1 = "DISTANCE", annotation2 = "EFFECTSIZE",
            highlight = significantSNP)

## ---- eval = TRUE--------------------------------------------------------
library(magrittr)

p <- manhattanly(subset(HapMap, CHR %in% 4:7), snp = "SNP", gene = "GENE",
            annotation1 = "DISTANCE", annotation2 = "EFFECTSIZE",
            highlight = significantSNP)

# get the x and y coordinates from the pre-processed data
plotData <- manhattanr(subset(HapMap, CHR %in% 4:7), snp = "SNP", gene = "GENE")[["data"]]

# annotate the smallest p-value
annotate <- plotData[which.min(plotData$P),]

# x and y coordinates of SNP with smallest p-value
xc <- annotate$pos
yc <- annotate$logp

p %>% plotly::layout(annotations = list(
  list(x = xc, y = yc,
       text = paste0(annotate$SNP,"<br>","GENE: ",annotate$GENE),
       font = list(family = "serif", size = 10))))


## ---- eval=FALSE---------------------------------------------------------
#  Sys.setenv("plotly_username"="your_plotly_username")
#  Sys.setenv("plotly_api_key"="your_api_key")

## ---- eval=FALSE---------------------------------------------------------
#  library(plotly)
#  # p is the interactive manhattan plot we saved earlier
#  plotly_POST(p, filename = "r-docs/manhattan", world_readable=TRUE)

## ------------------------------------------------------------------------
# create an object of class `manhattanr`
manhattanrObject <- manhattanr(HapMap)

# whats in there
str(manhattanrObject)

# the data used for plotting is a data.frame
# this data.frame can be used with any graphics function such as in base R
# you do not need to use plotly
head(manhattanrObject[["data"]])
is.data.frame(manhattanrObject[["data"]])

## ---- eval=FALSE---------------------------------------------------------
#  manhattanly(manhattanrObject)

## ------------------------------------------------------------------------
# create an object of class `manhattanr`
manhattanrObject <- manhattanr(HapMap, snp = "SNP", gene = "GENE",
            annotation1 = "DISTANCE", annotation2 = "EFFECTSIZE")

# the annotation columns are now part of the data.frame
head(manhattanrObject[["data"]])
is.data.frame(manhattanrObject[["data"]])

## ------------------------------------------------------------------------
qqrObject <- qqr(HapMap)
str(qqrObject)
head(qqrObject[["data"]])

## ---- eval=FALSE---------------------------------------------------------
#  qqly(qqrObject)

