## ----include=FALSE-------------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ----install, eval=FALSE-------------------------------------------------
#  install.packages('treebase')

## ----loadpkg-------------------------------------------------------------
#  library(treebase)

## ----search1, eval=FALSE, message=FALSE, warning=FALSE-------------------
#  both <- search_treebase("Ronquist or Hulesenbeck", by=c("author", "author"))
#  dolphins <- search_treebase('"Delphinus"', by="taxon", max_trees=5)
#  studies <- search_treebase("2377", by="id.study")

## ----search2, message=FALSE, warning=FALSE-------------------------------
#  Near <- search_treebase("Near", "author", branch_lengths=TRUE, max_trees=3)
#  Near[1]

## ----metadata, eval=FALSE, message=FALSE, warning=FALSE------------------
#  all <- download_metadata("", by="all")
#  dates <- sapply(all, function(x) as.numeric(x$date))
#  library(ggplot2)
#  qplot(dates, main="Treebase growth", xlab="Year", binwidth=.5)

## ----eval=FALSE, message=FALSE, warning=FALSE----------------------------
#  nature <- sapply(all, function(x) length(grep("Nature", x$publisher))>0)
#  science <- sapply(all, function(x) length(grep("^Science$", x$publisher))>0)
#  sum(nature)
#  sum(science)

## ----message=FALSE, warning=FALSE----------------------------------------
#  search_treebase("Derryberry", "author")[[1]] -> tree
#  plot(tree)

## ----message=FALSE, warning=FALSE, eval = FALSE--------------------------
#  library(laser)
#  tt <- branching.times(tree)
#  models <-  list(pb = pureBirth(tt),
#                  bdfit = bd(tt),
#                  y2r = yule2rate(tt), # yule model with single shift pt
#                  ddl = DDL(tt), # linear, diversity-dependent
#                  ddx = DDX(tt), #exponential diversity-dendent
#                  sv = fitSPVAR(tt), # vary speciation in time
#                  ev = fitEXVAR(tt), # vary extinction in time
#                  bv = fitBOTHVAR(tt)# vary both
#                  )
#  names(models[[3]])[5] <- "aic"
#  aics <- sapply(models, "[[", "aic")
#  # show the winning model
#  models[which.min(aics)]
#  
#  

## ----eval=FALSE, message=FALSE, warning=FALSE----------------------------
#  timetree <- function(tree){
#      check.na <- try(sum(is.na(tree$edge.length))>0)
#      if(is(check.na, "try-error") | check.na)
#        NULL
#      else
#      try( chronoMPL(multi2di(tree)) )
#  }
#  drop_errors <- function(tr){
#    tt <- tr[!sapply(tr, is.null)]
#    tt <- tt[!sapply(tt, function(x) is(x, "try-error"))]
#    print(paste("dropped", length(tr)-length(tt), "trees"))
#    tt
#  }
#  require(laser)
#  pick_branching_model <- function(tree){
#    m1 <- try(pureBirth(branching.times(tree)))
#    m2 <- try(bd(branching.times(tree)))
#    as.logical(try(m2$aic < m1$aic))
#  }

## ----eval=FALSE, message=FALSE, warning=FALSE----------------------------
#  all <- search_treebase("Consensus", "type.tree", branch_lengths=TRUE)
#  tt <- drop_errors(sapply(all, timetree))
#  is_yule <- sapply(tt, pick_branching_model)
#  table(is_yule)

