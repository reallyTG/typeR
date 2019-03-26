## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(eval = FALSE,collapse = TRUE,comment = "#")

## ---- eval = TRUE, message = FALSE---------------------------------------
library(lattice)
library(varbvs)

## ---- eval = TRUE--------------------------------------------------------
set.seed(1)

## ------------------------------------------------------------------------
#  load("cd.RData")
#  data(cytokine)

## ------------------------------------------------------------------------
#  fit.null <- varbvs(X,NULL,y,"binomial",logodds = -4,n0 = 0)

## ------------------------------------------------------------------------
#  logodds <- matrix(-4,442001,13)
#  logodds[cytokine == 1,] <- matrix(-4 + seq(0,3,0.25),6711,13,byrow = TRUE)
#  fit.cytokine <- varbvs(X,NULL,y,"binomial",logodds = logodds,n0 = 0,
#                         alpha = fit.null$alpha,mu = fit.null$mu,
#                         eta = fit.null$eta,optimize.eta = TRUE)

## ------------------------------------------------------------------------
#  BF <- varbvsbf(fit.null,fit.cytokine)

## ------------------------------------------------------------------------
#  save(list = c("fit.null","fit.cytokine","map","cytokine","BF"),
#       file = "varbvs.demo.cytokine.RData")

## ---- fig.width = 9,fig.height = 4,fig.align = "center"------------------
#  i <- which(fit.null$pip > 0.5 | fit.cytokine$pip > 0.5)
#  var.labels <- paste0(round(map$pos[i]/1e6,digits = 2),"Mb")
#  print(plot(fit.null,groups = map$chr,vars = i,var.labels = NULL,
#             gap = 7500,ylab = "posterior prob."),
#        split = c(1,1,1,2),more = TRUE)
#  print(plot(fit.cytokine,groups = map$chr,vars = i,var.labels = var.labels,
#             gap = 7500,ylab = "posterior prob."),
#        split = c(1,2,1,2),more = FALSE)

