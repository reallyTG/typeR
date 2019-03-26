## ------------------------------------------------------------------------
require("unrepx")
( pilotEff = yates(c(60,72,54,68,52,83,45,80), labels = c("T","C","K")) )

## ------------------------------------------------------------------------
yates(pilotEff)

## ---- fig.width=5, fig.height=5------------------------------------------
hnplot(pilotEff, ID = 10)
title("Half-normal plot of the pilot-plant effects")

## ---- fig.height=3, fig.width=5------------------------------------------
refplot(pilotEff, ID = 10)
title("Reference plot of the pilot-plant effects")

## ---- fig.width=5, fig.height=4------------------------------------------
parplot(pilotEff) 
title("Pareto plot of the pilot-plant effects")

## ------------------------------------------------------------------------
PSE(pilotEff)
PSE(pilotEff, method = "Lenth")

## ------------------------------------------------------------------------
eff.test(pilotEff)

## ---- fig.height=5, fig.width=5------------------------------------------
daniel.paper(15)

