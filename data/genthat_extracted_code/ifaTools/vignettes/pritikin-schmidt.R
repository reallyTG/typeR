## ----echo=FALSE, cache=FALSE------------------------------------------------------------------------------------------
#knit("pritikin-schmidt.Rnw", tangle=TRUE)  # to extract only the R chunks
suppressPackageStartupMessages(require("knitr"))
options(width=120, scipen=2, digits=2)
opts_chunk$set(echo=FALSE, cache=FALSE, highlight=FALSE, prompt=TRUE,
               comment=NA, background='#ffffff')
suppressPackageStartupMessages(library(OpenMx))
suppressPackageStartupMessages(library(rpf))
suppressPackageStartupMessages(library(ifaTools))
suppressPackageStartupMessages(library(reshape2))
suppressPackageStartupMessages(library(grid))
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(plyr))
source('plotTwoFactors.R')
options('xtable.math.style.negative'= TRUE)
options("xtable.booktabs"=TRUE)

## ----fig.height=4-----------------------------------------------------------------------------------------------------
skill.n <- 500
width <- 5
skill <- sort(runif(skill.n,-width,width))
item.p <- .4
empirical.bins <- 14
correct <- rep(TRUE, length(skill))
skill.o <- skill + rnorm(length(skill), sd=1)
correct[order(skill.o)[seq(1,(1-item.p) * length(skill))]] <- FALSE
grid <- list()
grid$correct <- correct
grid$skill <- skill
breaks <- seq(min(skill)-.001, max(skill)+.001, length.out=empirical.bins)
bin <- cut(skill, breaks, labels=FALSE)
bin.correct <- data.frame(at=breaks[-1] - diff(breaks)/2,
                          pct=vapply(1:max(bin), function(l) sum(correct[bin==l])/sum(bin==l), 0))
bin.correct$pct <- sprintf("%.0f", 100 * bin.correct$pct)
pl <- ggplot(as.data.frame(grid), aes(skill, correct)) +
    geom_point(position=position_jitter(0,.05), size=1) +
    geom_segment(data=data.frame(thresh=breaks),
                 aes(x=thresh, xend=thresh, y=TRUE, yend=FALSE), color="red") +
    geom_text(data=bin.correct, aes(x=at,y=1.5,label=pct), color="blue",
              angle=90) +
    labs(y="% correct")
print(pl)

## ---------------------------------------------------------------------------------------------------------------------
options(width=120, scipen=2, digits=2)
suppressPackageStartupMessages(library(OpenMx))
suppressPackageStartupMessages(library(rpf))
suppressPackageStartupMessages(library(ifaTools))
library(xtable)

# Adjust the path in the next statement to load your data
data <- read.csv(file='g341-19.csv',header=FALSE,sep='',quote="",stringsAsFactors=FALSE,check.names=FALSE)
colnames(data) <- mxMakeNames(colnames(data), unique=TRUE)

factors <- "ability"
numFactors <- length(factors)
spec <- list()
spec[1:6] <- list(rpf.drm(factors=numFactors))
spec[7:12] <- list(rpf.grm(factors=numFactors, outcomes=2))
names(spec) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", 
  "V11", "V12")

missingColumns <- which(is.na(match(names(spec), colnames(data))))
if (length(missingColumns)) {
  stop(paste('Columns missing in the data:', omxQuotes(names(spec)[missingColumns])))
}

data[names(spec)] <- mxFactor(data[names(spec)], levels = 0:1, labels=c("incorrect", "correct"))

#set.seed(1)   # uncomment to get the same starting values every time
startingValues <- mxSimplify2Array(lapply(spec, rpf.rparam))
rownames(startingValues) <- paste0('p', 1:nrow(startingValues))
rownames(startingValues)[1:numFactors] <- factors

imat <- mxMatrix(name='item', values=startingValues, free=!is.na(startingValues))
imat$free['p4',1:6] <- FALSE
imat$values['p4',1:6] <- Inf
imat$labels['ability',7:12] <- 'slope'
imat$labels['p3',1:1] <- 'V1_g'
imat$labels['p3',2:2] <- 'V2_g'
imat$labels['p3',3:3] <- 'V3_g'
imat$labels['p3',4:4] <- 'V4_g'
imat$labels['p3',5:5] <- 'V5_g'
imat$labels['p3',6:6] <- 'V6_g'
hasLabel <- !is.na(imat$labels)
for (lab1 in unique(imat$labels[hasLabel])) {
  imat$values[hasLabel & imat$labels==lab1] <- 
    sample(imat$values[hasLabel & imat$labels==lab1], 1)
}
data <- compressDataFrame(data)
itemModel <- mxModel(model='itemModel', imat,
           mxData(observed=data, type='raw', numObs=sum(data[['freq']]), sort=FALSE),
           mxExpectationBA81(ItemSpec=spec, weightColumn='freq'),
           mxFitFunctionML())

priorLabels <- c("V1_g", "V2_g", "V3_g", "V4_g", "V5_g", "V6_g")
priorMode <- rep(NA, length(priorLabels))
priorMode[1:6] <- logit(1/4)
priorModel <- univariatePrior('logit-norm', priorLabels, priorMode)
container <- mxModel(model='container', itemModel, priorModel,
  mxFitFunctionMultigroup(groups=c('itemModel.fitfunction', 'univariatePrior.fitfunction')))

emStep <- mxComputeEM('itemModel.expectation', 'scores',
  mxComputeNewtonRaphson(), verbose=0L,
  information='oakes1999', infoArgs=list(fitfunction='fitfunction'))
computePlan <- mxComputeSequence(list(EM=emStep,
         HQ=mxComputeHessianQuality(),
         SE=mxComputeStandardError()))
container <- mxModel(container, computePlan)

m1Fit <- mxRun(container, silent=TRUE)

m1Grp <- as.IFAgroup(m1Fit$itemModel, minItemsPerScore=1L)

## ----fig.height=2.5---------------------------------------------------------------------------------------------------
got <- sumScoreEAPTest(m1Grp)
df <- data.frame(score=as.numeric(names(got[['observed']])),
            expected=got[['expected']], observed=got[['observed']])
df <- melt(df, id='score', variable.name='source', value.name='n')
ggplot(df, aes(x=score, y=n, color=source)) + geom_line()

## ----results='asis'---------------------------------------------------------------------------------------------------
ct <- ChenThissen1997(m1Grp)
print(xtable(ct$pval, paste('Log $p$-value of local dependence between item pairs.'), "tab:ld", digits=1),
      table.placement="t!")

## ----results='asis'---------------------------------------------------------------------------------------------------
sfit <- SitemFit(m1Grp)
tbl <- t(sapply(sfit, function(r) c(n=r$n, df=r$df, statistic=r$statistic, '$\\log p$-value'=r$pval)))
print(xtable(tbl, paste0('Sum-score item-wise fit.'), 'tab:sitemfit', digits=c(0,0,0,2,2)),
      sanitize.colnames.function=function(x)x,
      table.placement="t!")

## ----fig.height=2.5---------------------------------------------------------------------------------------------------
map1 <- itemResponseMap(m1Grp, factor=1)
ggplot(map1, aes(x=score, y=item, label=outcome)) +
  geom_text(size=4, position=position_jitter(h=.25))

## ----fig.height=3-----------------------------------------------------------------------------------------------------
SitemPlot(sfit, names(sfit)[[1]])

## ----fig.height=3-----------------------------------------------------------------------------------------------------
iccPlot(m1Grp, names(sfit)[[1]])

## ----fig.height=3-----------------------------------------------------------------------------------------------------
basis <- rep(0, length(factors))
basis[1] <- 1
plotInformation(m1Grp, width=5, basis=basis)

## ---------------------------------------------------------------------------------------------------------------------
summary(m1Fit)

## ---------------------------------------------------------------------------------------------------------------------
options(width = 120, scipen = 2, digits = 2)
library(xtable)

# Adjust the path in the next statement to load your data
data <- read.csv(file = 'preschool.csv',stringsAsFactors = FALSE,check.names = FALSE)
colnames(data) <- mxMakeNames(colnames(data), unique = TRUE)
data[['freq']] <- as.numeric(data[['freq']])

factors <- "math"
numFactors <- length(factors)
spec <- list()
spec[1:2] <- list(rpf.nrm(factors = numFactors, outcomes = 4,T.a = 'trend', T.c = 'trend'))
names(spec) <- c("Match", "Identify")

missingColumns <- which(is.na(match(names(spec), colnames(data))))
if (length(missingColumns)) {
  stop(paste('Columns missing in the data:', omxQuotes(names(spec)[missingColumns])))
}

data[names(spec)] <- mxFactor(data[names(spec)], levels = 0:3, labels = c("neither", "3 only", "4 only", "both correct"))

set.seed(1)   # uncomment to get the same starting values every time
startingValues <- mxSimplify2Array(lapply(spec, rpf.rparam))
rownames(startingValues) <- paste0('p', 1:nrow(startingValues))
rownames(startingValues)[1:numFactors] <- factors

imat <- mxMatrix(name = 'item', values = startingValues, free = !is.na(startingValues))
imat$free['p2',] <- FALSE
imat$values['p2',1:2] <- 1
imat$free['p7',] <- FALSE
imat$values['p7',1:2] <- 0
imat$labels['p3',] <- 'eq1'
imat$labels['p5',] <- 'eq2'
hasLabel <- !is.na(imat$labels)
for (lab1 in unique(imat$labels[hasLabel])) {
  imat$values[hasLabel & imat$labels==lab1] <-
    sample(imat$values[hasLabel & imat$labels==lab1], 1)
}
itemModel <- mxModel(model = 'itemModel', imat,
           mxData(observed = data, type = 'raw', numObs = sum(data[['freq']]), sort = FALSE),
           mxExpectationBA81(ItemSpec = spec, weightColumn = 'freq'),
           mxFitFunctionML())


emStep <- mxComputeEM('itemModel.expectation', 'scores',
  mxComputeNewtonRaphson(), verbose = 0L,
  information = 'oakes1999', infoArgs = list(fitfunction = 'fitfunction'))
computePlan <- mxComputeSequence(list(emStep,
         mxComputeHessianQuality(),
         mxComputeStandardError()))

m1Fit <- mxRun(mxModel(itemModel, computePlan), silent = TRUE)
if (abs(m1Fit$output$fit - 2767.48) > .1) stop("Fit not achieved")

m1Grp <- as.IFAgroup(m1Fit, minItemsPerScore = 1L)

## ----results='asis'---------------------------------------------------------------------------------------------------
sfit <- SitemFit(m1Grp)
tbl <- t(sapply(sfit, function(r) c(n=r$n, df=r$df, statistic=r$statistic, '$\\log p$-value'=r$pval)))
print(xtable(tbl, paste0('Sum-score item-wise fit.'), 'tab:e3-sitemfit', digits=c(0,0,0,2,2)),
      sanitize.colnames.function=function(x)x,
      table.placement="t!")

## ---------------------------------------------------------------------------------------------------------------------
suppressWarnings(suppressMessages(summary(m1Fit, refModels=mxRefModels(m1Fit, run = TRUE))))

## ----fig.height=1.5---------------------------------------------------------------------------------------------------
map1 <- itemResponseMap(m1Grp, factor=1)
ggplot(map1, aes(x=score, y=item, label=outcome)) +
  geom_text(size=4, position=position_jitter(h=.25))

## ----echo=FALSE-------------------------------------------------------------------------------------------------------
# We do this here and again below because we
# need it for the figures and the figures
# need to be submitted early in the LaTeX pipeline.
m1 <- addExploratoryFactors(container, 0)
m1 <- mxRun(m1, silent=TRUE)
m2 <- addExploratoryFactors(container, 1)
m2 <- mxRun(m2, silent=TRUE)

## ----fig.height=3,echo=TRUE-------------------------------------------------------------------------------------------
container2 <- container
container2$itemModel$item$labels['ability', ] <- NA
m3 <- addExploratoryFactors(container2, 0)
m3 <- mxRun(m3, silent = TRUE)
mxCompare(m3, m1)

m4 <- addExploratoryFactors(container2, 1)
m4 <- mxRun(m4, silent = TRUE)
mxCompare(m4, m2)

grid.arrange(plotTwoFactors(m2$itemModel$item$values[1:2, ]) +
  labs(title = "a."), plotTwoFactors(m4$itemModel$item$values[1:2, ]) +
  labs(title = "b."), ncol = 2)

## ----fig.height=2-----------------------------------------------------------------------------------------------------
load("quad.rda")

gcontrol <- subset(control, !is.na(fit))
gcontrol <- ddply(gcontrol, ~qpoints + qwidth + modelFactors, summarize, pnorm=mean(pnorm))
gcontrol <- ddply(gcontrol, ~modelFactors, transform, pnorm=log(pnorm))
#  gcontrol$fit <- scale(control$fit - median(control$fit)) # TODO fix
pl <- ggplot(gcontrol,
             aes_string(x="qpoints", y="qwidth", fill="pnorm")) + geom_tile() +
  facet_wrap(~modelFactors) + labs(x="points", y="width") +
     guides(fill=guide_legend(title="log(error)"))
print(pl)

## ----echo=TRUE--------------------------------------------------------------------------------------------------------
m1 <- addExploratoryFactors(container, 0)
m1 <- mxRun(m1, silent = TRUE)
m2 <- addExploratoryFactors(container, 1)
m2 <- mxRun(m2, silent = TRUE)
mxCompare(m2, m1)

