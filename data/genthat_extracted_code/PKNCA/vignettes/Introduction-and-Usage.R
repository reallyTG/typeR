## ----setup, echo=FALSE, include=FALSE------------------------------------
library(PKNCA)

## ----setup_data----------------------------------------------------------
library(PKNCA)
library(dplyr, quietly=TRUE)

## Load the PK concentration data
d.conc <- datasets::Theoph %>%
  mutate(Subject=as.numeric(as.character(Subject)))
## Generate the dosing data
d.dose <- d.conc[d.conc$Time == 0,]
d.dose$Time <- 0

## Create a concentration object specifying the concentration, time, and
## subject columns.  (Note that any number of grouping levels is
## supported; you are not restricted to just grouping by subject.)
my.conc <- PKNCAconc(d.conc,
                     conc~Time|Subject)
## Create a dosing object specifying the dose, time, and subject
## columns.  (Note that the grouping factors should be the same as or a
## subset of the grouping factors for concentration, and the grouping
## columns must have the same names between concentration and dose
## objects.)
my.dose <- PKNCAdose(d.dose,
                     Dose~Time|Subject)
## Combine the concentration and dosing information both to
## automatically define the intervals for NCA calculation and provide
## doses for calculations requiring dose.
my.data <- PKNCAdata(my.conc, my.dose)

## Calculate the NCA parameters
my.results <- pk.nca(my.data)

## Summarize the results
summary(my.results)

## ------------------------------------------------------------------------
PKNCA.options()

## ----eval=FALSE----------------------------------------------------------
#  PKNCA.options(default=TRUE)

## ----eval=FALSE----------------------------------------------------------
#  PKNCA.set.summary(name="cmax",
#                    point=business.geomean,
#                    spread=business.geocv,
#                    rounding=list(signif=3))

## ----eval=FALSE----------------------------------------------------------
#  PKNCA.set.summary(name="tmax",
#                    point=business.median,
#                    spread=business.range,
#                    rounding=list(round=2))

## ----custom_summary_fun, eval=FALSE--------------------------------------
#  median_na <- function(x) {
#    median(x, na.rm=TRUE)
#  }
#  quantprob_na <- function(x) {
#    quantile(x, probs=c(0.05, 0.95), na.rm=TRUE)
#  }
#  PKNCA.set.summary(name="auclast",
#                    point=median_na,
#                    spread=quantprob_na,
#                    rounding=list(signif=3))

## ----multi_summary_settings, eval=FALSE----------------------------------
#  median_na <- function(x) {
#    median(x, na.rm=TRUE)
#  }
#  quantprob_na <- function(x) {
#    quantile(x, probs=c(0.05, 0.95), na.rm=TRUE)
#  }
#  PKNCA.set.summary(name=c("auclast", "cmax", "tmax", "half.life", "aucinf.pred"),
#                    point=median_na,
#                    spread=quantprob_na,
#                    rounding=list(signif=3))

## ----grouping, eval=FALSE------------------------------------------------
#  ## Generate a faux multi-study, multi-analyte dataset.
#  d.conc.parent <- d.conc
#  d.conc.parent$Subject <- as.numeric(as.character(d.conc.parent$Subject))
#  d.conc.parent$Study <- d.conc.parent$Subject <= 6
#  d.conc.parent$Analyte <- "Parent"
#  d.conc.metabolite <- d.conc.parent
#  d.conc.metabolite$conc <- d.conc.metabolite$conc/2
#  d.conc.metabolite$Analyte <- "Metabolite"
#  d.conc.both <- rbind(d.conc.parent, d.conc.metabolite)
#  d.conc.both <- d.conc.both[with(d.conc.both, order(Study, Subject, Time, Analyte)),]
#  d.dose.both <- d.conc.both[d.conc.both$Time == 0 & d.conc.both$Analyte %in% "Parent",
#                             c("Study", "Subject", "Dose", "Time")]
#  
#  ## Create a concentration object specifying the concentration, time,
#  ## study, and subject columns.  (Note that any number of grouping
#  ## levels is supporting; you are not restricted to this list.)
#  my.conc <- PKNCAconc(d.conc.both,
#                       conc~Time|Study+Subject/Analyte)
#  ## Create a dosing object specifying the dose, time, study, and
#  ## subject columns.  (Note that the grouping factors should be a
#  ## subset of the grouping factors for concentration, and the columns
#  ## must have the same names between concentration and dose objects.)
#  my.dose <- PKNCAdose(d.dose.both,
#                       Dose~Time|Study+Subject)
#  
#  # Perform and summarize the PK data as previously described
#  my.data <- PKNCAdata(my.conc, my.dose)
#  my.results <- pk.nca(my.data)
#  summary(my.results)

## ------------------------------------------------------------------------
intervals <-
  data.frame(start=0, end=c(24, Inf),
             cmax=c(FALSE, TRUE),
             tmax=c(FALSE, TRUE),
             auclast=TRUE,
             aucinf.obs=c(FALSE, TRUE))

## ----asis=TRUE, echo=FALSE-----------------------------------------------
knitr::kable(PKNCA.options()$single.dose.aucs)

## ------------------------------------------------------------------------
## find.tau can work when all doses have the same interval...
dose.times <- seq(0, 168, by=24)
print(dose.times)
PKNCA::find.tau(dose.times)

## or when the doses have mixed intervals (10 and 24 hours).
dose.times <- sort(c(seq(0, 168, by=24),
                     seq(10, 178, by=24)))
print(dose.times)
PKNCA::find.tau(dose.times)

## ----eval=FALSE----------------------------------------------------------
#  my.intervals <-
#    data.frame(start=0, end=c(24, Inf),
#               cmax=c(FALSE, TRUE),
#               tmax=c(FALSE, TRUE),
#               auclast=TRUE,
#               aucinf.obs=c(FALSE, TRUE))
#  my.data <- PKNCAdata(my.conc, my.dose,
#                       intervals=my.intervals)

## ----eval=FALSE----------------------------------------------------------
#  my.data <- PKNCAdata(my.conc, my.dose)
#  my.intervals <- my.data$intervals
#  my.intervals$aucinf.obs[1] <- TRUE
#  my.data$intervals <- my.intervals

