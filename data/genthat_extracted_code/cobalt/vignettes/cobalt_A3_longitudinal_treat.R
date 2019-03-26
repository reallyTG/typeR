## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(message = FALSE, fig.width=5)

## ------------------------------------------------------------------------
library("cobalt")
data("iptwExWide", package = "twang")
head(iptwExWide)

## ------------------------------------------------------------------------
library("WeightIt")
Wmsm <- weightitMSM(list(tx1 ~ use0 + gender + age,
                         tx2 ~ use0 + gender + age + use1 + tx1,
                         tx3 ~ use0 + gender + age + use1 + tx1 + use2 + tx2),
                    data = iptwExWide,
                    method = "ps")

## ------------------------------------------------------------------------
bal.tab(list(iptwExWide[c("use0", "gender", "age")],
             iptwExWide[c("use0", "gender", "age", "use1", "tx1")],
             iptwExWide[c("use0", "gender", "age", "use1", "tx1", "use2", "tx2")]),
        treat.list = iptwExWide[c("tx1", "tx2", "tx3")])

## ------------------------------------------------------------------------
bal.tab(Wmsm, un = TRUE)

## ------------------------------------------------------------------------
bal.tab(Wmsm, which.time = 1:2, msm.summary = FALSE)

## ---- fig.height=4-------------------------------------------------------
bal.plot(Wmsm, var.name = "age", which = "both")

## ---- fig.height=4-------------------------------------------------------
bal.plot(Wmsm, var.name = "tx1", which = "both")

## ------------------------------------------------------------------------
love.plot(bal.tab(Wmsm), abs = TRUE)

## ---- fig.width=4--------------------------------------------------------
love.plot(bal.tab(Wmsm), which.time = NA)

