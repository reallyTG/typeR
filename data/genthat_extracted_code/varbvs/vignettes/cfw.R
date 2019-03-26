## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(eval = FALSE,collapse = TRUE,comment = "#")

## ---- eval = TRUE, message = FALSE---------------------------------------
library(lattice)
library(varbvs)

## ---- eval = TRUE--------------------------------------------------------
trait      <- "testis"
covariates <- "sacwt"
logodds    <- seq(-5,-3,0.25)
sa         <- 0.05

## ---- eval = TRUE--------------------------------------------------------
set.seed(1)

## ------------------------------------------------------------------------
#  load("cfw.RData")

## ------------------------------------------------------------------------
#  rows <- which(apply(pheno[,c(trait,covariates)],1,
#                      function (x) sum(is.na(x)) == 0))
#  pheno <- pheno[rows,]
#  geno  <- geno[rows,]

## ------------------------------------------------------------------------
#  runtime <- system.time(fit <-
#    varbvs(geno,as.matrix(pheno[,covariates]),pheno[,trait],
#           sa = sa,logodds = logodds,verbose = FALSE))
#  cat(sprintf("Model fitting took %0.2f minutes.\n",runtime["elapsed"]/60))

## ------------------------------------------------------------------------
#  print(summary(fit))

## ---- fig.width = 7,fig.height = 5.5, fig.align = "center"---------------
#  trellis.par.set(axis.text     = list(cex = 0.7),
#                  par.ylab.text = list(cex = 0.7),
#                  par.main.text = list(cex = 0.7,font = 1))
#  j <- which(fit$pip > 0.5)
#  r <- gwscan.gemma[[trait]]
#  r[is.na(r)] <- 0
#  chromosomes   <- levels(gwscan.bvsr$chr)
#  xticks        <- rep(0,length(chromosomes))
#  names(xticks) <- chromosomes
#  pos           <- 0
#  for (i in chromosomes) {
#    n         <- sum(gwscan.bvsr$chr == i)
#    xticks[i] <- pos + n/2
#    pos       <- pos + n + 25
#  }
#  print(plot(fit,groups = map$chr,vars = j,gap = 1500,cex = 0.6,
#             ylab = "probability",main = "a. multi-marker (varbvs)",
#             scales = list(y = list(limits = c(-0.1,1.2),at = c(0,0.5,1))),
#             vars.xyplot.args = list(cex = 0.6)),
#        split = c(1,1,1,3),more = TRUE)
#  print(plot(fit,groups = map$chr,score = r,vars = j,cex = 0.6,gap = 1500,
#             draw.threshold = 5.71,ylab = "-log10 p-value",
#             main = "b. single-marker (GEMMA -lm 2)",
#             scales = list(y = list(limits = c(-1,20),at = seq(0,20,5))),
#             vars.xyplot.args = list(cex = 0.6)),
#       split = c(1,2,1,3),more = TRUE)
#  print(xyplot(p1 ~ plot.x,gwscan.bvsr,pch = 20,col = "midnightblue",
#               scales = list(x = list(at = xticks,labels = chromosomes),
#                             y = list(limits = c(-0.1,1.2),at = c(0,0.5,1))),
#               xlab = "",ylab = "probability",main = "c. multi-marker (BVSR)"),
#        split = c(1,3,1,3),more = FALSE)

## ------------------------------------------------------------------------
#  sessionInfo()

