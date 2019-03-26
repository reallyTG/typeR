## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  fig.width  = 7,
  fig.height = 4.5,
  fig.align  = "center",
#  cache      = TRUE,
  autodep    = TRUE
)

## ------------------------------------------------------------------------
library(Synth)
data(basque)
colnames(basque)
basque[703,]

## ------------------------------------------------------------------------
library(MSCMT)
Basque <- listFromLong(basque, unit.variable="regionno", time.variable="year", unit.names.variable="regionname")
names(Basque)
head(Basque$gdpcap)

## ------------------------------------------------------------------------
# define the sum of all cases
school.sum <- with(Basque,colSums(school.illit + school.prim + school.med + school.high  + school.post.high))
# combine school.high and school.post.high in a single class
Basque$school.higher <- Basque$school.high + Basque$school.post.high
# calculate ratios and multiply by number of observations to obtain percentages from totals 
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
res <- mscmt(Basque, treatment.identifier, controls.identifier, times.dep, times.pred, agg.fns, seed=1)

## ------------------------------------------------------------------------
res

## ------------------------------------------------------------------------
library(ggplot2)
ggplot(res, type="comparison")

## ------------------------------------------------------------------------
ggplot(res, type="gaps")

## ------------------------------------------------------------------------
ggplot(res, what=c("gdpcap","invest","school.higher","sec.energy"), type="comparison")

## ------------------------------------------------------------------------
library(parallel)
cl <- makeCluster(2)
resplacebo <- mscmt(Basque, treatment.identifier, controls.identifier, times.dep, times.pred, agg.fns, cl=cl, placebo=TRUE, seed=1)
stopCluster(cl)

## ------------------------------------------------------------------------
ggplot(resplacebo[["Cataluna"]], type="comparison")

## ------------------------------------------------------------------------
ggplot(resplacebo)

## ------------------------------------------------------------------------
ggplot(resplacebo, exclude.ratio=5, ratio.type="mspe")

## ------------------------------------------------------------------------
pvalue(resplacebo, exclude.ratio=5, ratio.type="mspe", alternative="less")
ggplot(resplacebo, exclude.ratio=5, ratio.type="mspe", type="p.value", alternative="less")

## ------------------------------------------------------------------------
did(resplacebo, range.post=c(1970,1990), exclude.ratio=5, alternative="less")

