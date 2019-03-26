## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  fig.width  = 7,
  fig.height = 4,
  fig.align  = "center",
#  cache      = TRUE,
  autodep    = TRUE
)

## ------------------------------------------------------------------------
library(Synth)
data(basque)
library(MSCMT)
Basque <- listFromLong(basque, unit.variable="regionno", time.variable="year", unit.names.variable="regionname")
school.sum <- with(Basque,colSums(school.illit + school.prim + school.med + school.high  + school.post.high))
Basque$school.higher <- Basque$school.high + Basque$school.post.high
for (item in c("school.illit", "school.prim", "school.med", "school.higher"))      
  Basque[[item]] <- 6 * 100 * t(t(Basque[[item]]) / school.sum)

## ------------------------------------------------------------------------
treatment.identifier <- "Basque Country (Pais Vasco)"
controls.identifier  <- setdiff(colnames(Basque[[1]]),
                                c(treatment.identifier, "Spain (Espana)"))
times.dep  <- cbind("gdpcap"                = c(1960,1969))
times.pred <- cbind("school.illit"          = c(1964,1969),
                    "school.prim"           = c(1964,1969),
                    "school.med"            = c(1964,1969),
                    "school.higher"         = c(1964,1969),
                    "invest"                = c(1964,1969),
                    "gdpcap"                = c(1960,1969),
                    "sec.agriculture"       = c(1961,1969),
                    "sec.energy"            = c(1961,1969),
                    "sec.industry"          = c(1961,1969),
                    "sec.construction"      = c(1961,1969),
                    "sec.services.venta"    = c(1961,1969),
                    "sec.services.nonventa" = c(1961,1969),
                    "popdens"               = c(1969,1969))
agg.fns <- rep("mean", ncol(times.pred))                       

## ------------------------------------------------------------------------
res <- mscmt(Basque, treatment.identifier, controls.identifier, times.dep, times.pred, agg.fns, seed=1, single.v=TRUE, verbose=FALSE)
res

## ------------------------------------------------------------------------
times.pred <- times.pred[,-6]
agg.fns <- rep("mean", ncol(times.pred))                       
res2 <- mscmt(Basque, treatment.identifier, controls.identifier, times.dep, times.pred, agg.fns, seed=1, single.v=TRUE, verbose=FALSE)
res2

## ------------------------------------------------------------------------
agg.fns <- rep("id", ncol(times.pred))   # Omitting agg.fns has the same effect (as "id" is the default)
res3 <- mscmt(Basque, treatment.identifier, controls.identifier, times.dep, times.pred, agg.fns, seed=1, single.v=TRUE, verbose=FALSE)
res3

