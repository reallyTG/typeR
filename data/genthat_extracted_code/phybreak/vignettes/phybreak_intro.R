## ---- echo =FALSE--------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ------------------------------------------------------------------------
library(phybreak)

sequences_FMD2007 <- read.GenBank(paste0("EU4483", 71:81))
names(sequences_FMD2007) <- c("IP1b/1", "IP1b/2", "IP2b", "IP2c",
                      "IP3b", "IP3c", "IP4b", "IP5", "IP6b",
                      "IP7", "IP8")
dates_FMD2007 <- as.Date(c("2007/08/03", "2007/08/04", "2007/08/06",
                   "2007/08/07", "2007/09/12", "2007/09/15",
                   "2007/09/13", "2007/09/17", "2007/09/21",
                   "2007/09/24", "2007/09/29"))

# these data are also included with the package
data("FMD_2007")
sequences_FMD2007 <- FMD_2007$sequences
dates_FMD2007 <- FMD_2007$dates

## ------------------------------------------------------------------------
dataset_FMD2007 <- phybreakdata(sequences = sequences_FMD2007, 
                                sample.times = dates_FMD2007)

## ------------------------------------------------------------------------
head(dataset_FMD2007)

## ------------------------------------------------------------------------
# load the data
data("FMD_2001")

# extract names and dates by splitting the rownames
namesdates_FMD2001 <- strsplit(rownames(FMD_2001), "_")               #split the rownames
names_FMD2001 <- sapply(namesdates_FMD2001, '[', i = 1)               #1st element is name
dates_FMD2001 <- as.numeric(sapply(namesdates_FMD2001, '[', i = 2))   #2nd element is date

# make phybreakdata object
dataset_FMD2001 <- phybreakdata(sequences = FMD_2001,
                                sample.times =  dates_FMD2001,
                                sample.names = names_FMD2001)

## ------------------------------------------------------------------------
head(dataset_FMD2001)

## ---- include=FALSE------------------------------------------------------
set.seed(0)

## ---- fig.width=5, fig.height=5------------------------------------------
phybreak_FMD2007 <- phybreak(dataset = dataset_FMD2007)

plotTrans(phybreak_FMD2007)
plotPhylo(phybreak_FMD2007)

## ---- fig.width=5, fig.height=5------------------------------------------
phybreak_FMD2007_2 <- phybreak(dataset = dataset_FMD2007, gen.mean = 14, sample.mean = 14)

plotTrans(phybreak_FMD2007_2)
plotPhylo(phybreak_FMD2007_2)

## ------------------------------------------------------------------------
get.parameters(phybreak_FMD2007)

## ------------------------------------------------------------------------
library(coda)
mcmc_FMD2007 <- get.mcmc(phybreak_FMD2007)

effectiveSize(mcmc_FMD2007)

## ---- fig.width=7--------------------------------------------------------
plot(mcmc_FMD2007[, "mS"])

## ------------------------------------------------------------------------
summary(mcmc_FMD2007[, c("mu", "mS", "mG", "slope")])

## ------------------------------------------------------------------------
transtree(phybreak_FMD2007, method = "count")

## ------------------------------------------------------------------------
transtree(phybreak_FMD2007, method = "edmonds")

## ---- fig.width=5--------------------------------------------------------
plotTrans(phybreak_FMD2007, plot.which = "edmonds")

## ------------------------------------------------------------------------
transtree(phybreak_FMD2007, method = "mpc")

## ---- fig.width=5--------------------------------------------------------
plotPhylo(phybreak_FMD2007, plot.which = "mpc")

## ------------------------------------------------------------------------
transtree(phybreak_FMD2007, method = "mtcc")

## ------------------------------------------------------------------------
infectorsets(phybreak_FMD2007, which.hosts = "all", percentile = 0.95, minsupport = 0)

## ---- include=FALSE------------------------------------------------------
set.seed(0)

## ---- fig.width=5--------------------------------------------------------
transtree(phybreak_FMD2007, method = "edmonds")
plotTrans(phybreak_FMD2007, plot.which = "edmonds")

