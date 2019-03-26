## ----"setup", include=FALSE----------------------------------------------
require("knitr")
opts_knit$set(root.dir = ".")
library(denoiSeq)

## ---- echo=TRUE----------------------------------------------------------
dim(ERCC)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(ERCC, 4))

## ---- echo=TRUE----------------------------------------------------------
ERCC <- ERCC[rowSums(ERCC) > 0, ]
dim(ERCC)

## ---- echo=TRUE----------------------------------------------------------
reps <- list(A=c(1,2,3,4,5), B=c(6,7,8,9,10))#specifying the columns for each condition
m <- dim(ERCC)[1]
initvalues <- list(N_A = rep(1, m), N_B = rep(1, m), p = 0.0001, f = 0.01)
stepsizes <- list(stepsizeN_A = rep(1, m), stepsizeN_B = rep(1, m)
                  , stepsize_p = 5e+07, stepsize_f = 1e3)
RD2 <- new("readsData", counts = ERCC, replicates = reps, initValues
           = initvalues, stepSizes = stepsizes)

## ---- echo=TRUE----------------------------------------------------------
steps <- 100#100 steps are just for illustration here. Atleast 5000 steps are adequate. 

BI2 <- denoiseq(RD2, steps)

## ---- echo=TRUE----------------------------------------------------------
rope = 0.5
rez2 <- results(BI2, steps, rope_limit = rope)

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(head(rez2))

## ---- echo=TRUE----------------------------------------------------------
samples <- getSamplesOf(BI2, "ERCC-00051", steps)
acceptance_rate <- length(unique(samples)) / steps
acceptance_rate

## ---- echo=TRUE, fig.show='hold'-----------------------------------------
plot(samples, type="l", main = "History plot of ERCC-00051")
AL <- acf(samples, main = "Auto lag plot of ERCC-00051", lag.max = 30,
          type = c("correlation"), plot = T)

## ---- echo=TRUE----------------------------------------------------------
sessionInfo()

