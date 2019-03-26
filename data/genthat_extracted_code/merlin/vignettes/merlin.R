## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(merlin)
data("pbc")
pbc[1:11,c("id","years","status","status2","drug","serBilir","prothrombin","year")]

## ------------------------------------------------------------------------
pbc$stime <- pbc$years
pbc$stime[duplicated(pbc$id)] <- NA
pbc$died <- pbc$status2
pbc$died[duplicated(pbc$id)] <- NA

## ------------------------------------------------------------------------
pbc$logb <- log(pbc$serBilir) 
pbc$logp <- log(pbc$prothrombin)
pbc$time <- pbc$year
pbc$trt <- as.numeric(pbc$drug) - 1

## ------------------------------------------------------------------------
pbc[1:11,c("id","stime","died","logb","logp","time")]

## ---- cache = TRUE-------------------------------------------------------
lin.model <- merlin(logb ~ time, family = "gaussian", data = pbc)
lin.model
summary(lin.model)

## ---- cache = TRUE-------------------------------------------------------
rcs.model <- merlin(logb ~ rcs(time, df = 3), family = "gaussian", timevar = "time", data = pbc)
summary(rcs.model)

## ---- cache = TRUE-------------------------------------------------------
r.int.model <- merlin(logb ~ rcs(time, df = 3) + M1[id]*1,
                      family = "gaussian",
                      levels = "id",
                      timevar = "time",
                      data = pbc)
summary(r.int.model)

## ---- cache = TRUE-------------------------------------------------------
r.slope.model <- merlin(logb ~ rcs(time, df = 3) + M1[id]*1 + time:M2[id]*1,
                        family = "gaussian",
                        timevar = "time",
                        levels = "id",
                        ip = 15,
                        data = pbc)
summary(r.slope.model)

