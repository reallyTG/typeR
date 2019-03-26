library(party)


### Name: Plot BinaryTree
### Title: Visualization of Binary Regression Trees
### Aliases: plot.BinaryTree
### Keywords: hplot

### ** Examples


  set.seed(290875)

  airq <- subset(airquality, !is.na(Ozone))
  airct <- ctree(Ozone ~ ., data = airq)

  ### regression: boxplots in each node
  plot(airct, terminal_panel = node_boxplot, drop_terminal = TRUE)

  if(require("TH.data")) {
  ## classification: barplots in each node
  data("GlaucomaM", package = "TH.data")
  glauct <- ctree(Class ~ ., data = GlaucomaM)
  plot(glauct)
  plot(glauct, inner_panel = node_barplot,
    edge_panel = function(ctreeobj, ...) { function(...) invisible() },
    tnex = 1)

  ## survival: Kaplan-Meier curves in each node
  data("GBSG2", package = "TH.data")
  library("survival")
  gbsg2ct <- ctree(Surv(time, cens) ~ ., data = GBSG2)
  plot(gbsg2ct)
  plot(gbsg2ct, type = "simple")  
  }




