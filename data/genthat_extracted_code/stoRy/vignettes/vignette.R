## ----echo=FALSE, message=FALSE-------------------------------------------
library(knitr)
library(stoRy)
options(replace.assign=FALSE)

opts_chunk$set(fig.path='knitr_figure_poweRlaw/graphics-', 
               cache.path='knitr_cache_poweRlaw/', 
               fig.align='center', 
               dev='pdf', fig.width=5, fig.height=5, 
               fig.show='hold', cache=FALSE, par=TRUE,
               out.width='0.4\\textwidth')
knit_hooks$set(crop=hook_pdfcrop)

knit_hooks$set(par=function(before, options, envir){
  if (before && options$fig.show!='none') {
    par(mar=c(3,4,2,1),cex.lab=.95,cex.axis=.9,
        mgp=c(3,.7,0),tcl=-.01, las=1)
  }}, crop=hook_pdfcrop)

set.seed(1)
palette(c(rgb(170,93,152, maxColorValue=255),
          rgb(103,143,57, maxColorValue=255),
          rgb(196,95,46, maxColorValue=255),
          rgb(79,134,165, maxColorValue=255),
          rgb(205,71,103, maxColorValue=255),
          rgb(203,77,202, maxColorValue=255),
          rgb(115,113,206, maxColorValue=255)))

## ----installation, eval=FALSE--------------------------------------------
#  install.packages("stoRy")

## ----loading, eval=FALSE-------------------------------------------------
#  library("stoRy")

## ----eval=FALSE----------------------------------------------------------
#  help(package="stoRy")

## ----eval=FALSE----------------------------------------------------------
#  vignette(package="stoRy")

## ----tidy=FALSE, eval=FALSE----------------------------------------------
#  ?get_enriched_themes

## ----eval=FALSE----------------------------------------------------------
#  story_id <- "tos1x19"
#  mystory <- story$new(story_id)
#  print(mystory)

## ----eval=FALSE----------------------------------------------------------
#  mystory$themes

## ----eval=FALSE----------------------------------------------------------
#  mystory$settings
#  mystory$keywords

## ----eval=FALSE----------------------------------------------------------
#  mystory$add_theme(theme = "neo-luddist utopia", level = "central")

## ----eval=FALSE----------------------------------------------------------
#  mystory$remove_theme(theme = "neo-luddist utopia")

## ----eval=FALSE----------------------------------------------------------
#  mystory$add_setting(setting = "mountain")
#  mystory$remove_setting(setting = "mountain")
#  mystory$add_keyword(keyword = "Captain Kirk is climbing a mountain")
#  mystory$remove_keyword(keyword = "Captain Kirk is climbing a mountain")

## ----eval=FALSE----------------------------------------------------------
#  load("R/sysdata.rda")
#  sysdata$RESERVED_STORY_IDS

## ----eval=FALSE----------------------------------------------------------
#  load("R/sysdata.rda")
#  head(sysdata$story_metadata)

## ----eval=FALSE----------------------------------------------------------
#  theme_name <- "utopia"
#  mytheme <- theme$new(theme_name)
#  mytheme$print()

## ----eval=FALSE----------------------------------------------------------
#  print_tree(mytheme)

## ----eval=FALSE----------------------------------------------------------
#  theme_name <- "society"
#  mytheme <- theme$new(theme_name)
#  print_tree(mytheme, pruneMethod = "dist", limit = 50)

## ----eval=FALSE----------------------------------------------------------
#  file <- system.file("storysets", "aliens.smt", package = "stoRy")
#  mystorysets <- storysets$new(file)
#  print(mystorysets)

## ----eval=FALSE----------------------------------------------------------
#  results <- get_enriched_themes(mystorysets,
#                 test_storysets = "KLINGON",
#                 background_storyset = c("tos", "tas"))

## ----eval=FALSE----------------------------------------------------------
#  results$KLINGON[1:20,]

## ----eval=FALSE----------------------------------------------------------
#  results <- get_enriched_themes(mystorysets,
#                 test_storysets = "KLINGON",
#                 background_storyset = "tng")
#  results$KLINGON[1:20,]

## ----eval=FALSE----------------------------------------------------------
#  file <- system.file("storysets", "series.smt", package = "stoRy")
#  mystorysets <- storysets$new(file)
#  print(mystorysets)

## ----eval=FALSE----------------------------------------------------------
#  results <- get_enriched_themes(mystorysets)

## ----eval=FALSE----------------------------------------------------------
#  results$TOS[1:20,]
#  results$TAS[1:10,]
#  results$TNG[1:20,]
#  results$VOY[1:20,]

## ----eval=FALSE----------------------------------------------------------
#  story_id <- "voy3x05"
#  mystory <- story$new(story_id)

## ----eval=FALSE----------------------------------------------------------
#  result <- get_similar_stories(mystory)

## ----eval=FALSE----------------------------------------------------------
#  result[1:10,]

