## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(knitr)
library(interlineaR)
library(kableExtra)

## ------------------------------------------------------------------------
corpuspath <- system.file("exampleData", "tuwariInterlinear.xml", package="interlineaR")
corpus <- read.emeld(corpuspath, vernacular.languages="tww")

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  head(corpus$morphemes)

## ----echo=FALSE----------------------------------------------------------
kable(head(corpus$morphemes))

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  head(corpus$words)

## ----echo=FALSE----------------------------------------------------------
kable(head(corpus$words))

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  head(corpus$sentences)

## ----echo=FALSE----------------------------------------------------------
kable(head(corpus$sentences), booktabs = T)

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  head(corpus$texts)

## ----echo=FALSE----------------------------------------------------------
kable(head(corpus$texts))

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  morphemes_words <- merge(corpus$morphemes, corpus$words[,-c(1,2)], by="word_id", suffixes = c(".morpheme",".word"))
#  head(morphemes_words)

## ----echo=FALSE----------------------------------------------------------
morphemes_words <- merge(corpus$morphemes, corpus$words[,-c(1,2)], by="word_id", suffixes = c(".morpheme",".word"))
kable(head(morphemes_words))

## ------------------------------------------------------------------------
corpuspath <- system.file("exampleData", "tuwariToolbox.txt", package="interlineaR")
corpus <- read.toolbox(corpuspath)

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  head(corpus$morphemes)

## ----echo=FALSE----------------------------------------------------------
kable(head(corpus$morphemes))

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  path <- system.file("exampleData", "kakabe.txt", package="interlineaR")
#  corpus <- read.toolbox(path, morpheme.fields.suppl = c("gr", "gf"))
#  head(corpus$morphemes)

## ----echo=FALSE----------------------------------------------------------
path <- system.file("exampleData", "kakabe.txt", package="interlineaR")
corpus <- read.toolbox(path, morpheme.fields.suppl = c("gr", "gf"))
kable(head(corpus$morphemes))

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  head(corpus$sentences)

## ----echo=FALSE----------------------------------------------------------
kable(head(corpus$sentences))

## ------------------------------------------------------------------------
dicpath <- system.file("exampleData", "tuwariDictionary.lift", package="interlineaR")
dictionary <- read.lift(dicpath, vernacular.languages="tww", simplify=TRUE)

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  head(dictionary$entries)

## ----echo=FALSE----------------------------------------------------------
kable(head(dictionary$entries))

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  head(dictionary$senses)

## ----echo=FALSE----------------------------------------------------------
kable(head(dictionary$senses))

## ----eval=FALSE, include=TRUE, echo=TRUE---------------------------------
#  head(dictionary$examples)

## ----echo=FALSE----------------------------------------------------------
kable(head(dictionary$examples))

