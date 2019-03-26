## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(DepLogo)

## ---- fig.show='hold',echo=FALSE,fig.width=4,fig.height=5,fig.cap="*Original dependency logo (left) and showcase example of several new features of the DepLogo R-package (right).*"----

seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p(seqs[, 2]) )


plotDeplogo(data = data, dep.fun.legend = FALSE)
plotDeplogo(data = data, dep.fun = plotDepmatrix, weight.fun = subBoxes)


## ----ann, echo=FALSE, fig.cap="*Annotated version of a dependency logo.*", out.width=700----
knitr:::include_graphics("annotated_deplogo.png")

## ---- fig.show='hold',echo=FALSE,fig.width=4,fig.height=3----------------

seqs <- scan(system.file("extdata", "pwm_bak.txt", package = "DepLogo"), what="character", comment.char = ">")
data <- DLData(seqs)
plotDeplogo(data)

seqs <- scan(system.file("extdata", "wam2_bak.txt", package = "DepLogo"), what="character", comment.char = ">")
data <- DLData(seqs)
plotDeplogo(data)

seqs <- scan(system.file("extdata", "wam_bak.txt", package = "DepLogo"), what="character", comment.char = ">")
data <- DLData(seqs)
plotDeplogo(data)

seqs <- scan(system.file("extdata", "long_bak.txt", package = "DepLogo"), what="character", comment.char = ">")
data <- DLData(seqs)
plotDeplogo(data)

## ----echo=FALSE,fig.width=4,fig.height=4---------------------------------
plotBlocks(data, show.number = FALSE, block.fun = colorchart)
axis(1)

## ----eval=FALSE----------------------------------------------------------
#  pchisq(I, df = (length(alphabet) - 1)^2, lower.tail = FALSE)

## ------------------------------------------------------------------------
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), stringsAsFactors = FALSE)
head(seqs)

## ------------------------------------------------------------------------
data <- DLData(sequences = seqs[, 1],weights = log1p(seqs[, 2]) )

## ------------------------------------------------------------------------

plotDeplogo(data = data)


## ------------------------------------------------------------------------
plotDeplogo(data = data, show.dependency.pvals = TRUE)

## ------------------------------------------------------------------------
plotDeplogo(data = data, dep.fun = plotDepmatrix, show.dependency.pvals = TRUE)

## ------------------------------------------------------------------------

plotDeplogo(data = data, dep.fun = plotDepmatrix, block.fun = deprects, summary.fun = logo)

plotDeplogo(data = data, dep.fun = plotDepmatrix, block.fun = colorchart, summary.fun = logo)


## ----fig.show='hold',fig.width=4,fig.height=5----------------------------
data.rc <- revcom(data)

plotDeplogo(data)
plotDeplogo(data.rc)

## ------------------------------------------------------------------------
plotDeplogo(data = data, threshold = 0.01, minPercent = 0.01, maxNum = 8)

## ------------------------------------------------------------------------
plotDeplogo(data = data, threshold = 0.04)

## ------------------------------------------------------------------------
plotDeplogo(data = data)

## ------------------------------------------------------------------------
plotDeplogo(data = data, threshold = 1.0)

## ------------------------------------------------------------------------

prot <- c("I", "L", "V", "F", "M", "C", "A", "G", "P", "T", "S", "Y", "W", "Q", "N", "H", "E", "D", "K", "R", "B", "Z", "X","-")
colors <- rainbow(length(prot))

## ------------------------------------------------------------------------
alphabet.protein.gap

## ------------------------------------------------------------------------
dat <- read.table(system.file("extdata", "Glycos_trans_3N.ann", package = "DepLogo"), stringsAsFactors = FALSE, fill = TRUE)
dat <- dat[-nrow(dat), 2]
dat <- toupper(gsub(pattern = "\\.", "-", dat))

## ------------------------------------------------------------------------
data <- DLData(sequences = dat, symbols = prot, colors = colors)

## ------------------------------------------------------------------------
dim(data)

## ------------------------------------------------------------------------
fun <- filter.by.gaps(0.1)
dat2 <- filterColumns(data = data, filter.fun = fun)
dim(dat2)

## ------------------------------------------------------------------------
data2 <- replaceColors(dat2, suggestColors(dat2))

## ------------------------------------------------------------------------
plotDeplogo(data2, threshold = 0.6)

## ------------------------------------------------------------------------
plotDeplogo(data2, threshold = 0.6, block.fun = logo)

## ------------------------------------------------------------------------
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p(seqs[, 2]) )

## ------------------------------------------------------------------------
plotDeplogo(data = data, weight.fun = subBoxes)

## ------------------------------------------------------------------------
seqs <- read.table(system.file("extdata", "nrsf.txt", package = "DepLogo"), stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[,1], weights = log1p(seqs[,2]) )

plotDeplogo(data = data, threshold = 0.03, weight.fun = subBoxes)

## ------------------------------------------------------------------------
plotDeplogo(data = data, threshold = 0.03, weight.fun = subLines)

## ----fig.width=6,fig.height=8--------------------------------------------
plotDeplogo(data = data, weight.fun = subBoxes, chunks = c(1000, 2000, length(data) - 3000), chunk.height = c(200, 200, 700))

## ------------------------------------------------------------------------
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1] )

plotDeparcs(data)
plotDepmatrix(data)

## ------------------------------------------------------------------------
plotDepmatrix(data, axis.at.bottom = FALSE, show.pvals = TRUE)

## ------------------------------------------------------------------------

seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p( seqs[, 2] ) )

partitions <- partition(data, threshold = 0.3, minElements = 100)

## ------------------------------------------------------------------------
plotBlocks(data = partitions)

plotBlocks(data = partitions, block.fun = colorchart)

plotBlocks(data = partitions, block.fun = logo)


## ------------------------------------------------------------------------
plotBlocks(data = partitions, ic.scale = FALSE)

