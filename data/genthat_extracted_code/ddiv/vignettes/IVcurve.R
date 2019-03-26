## ---- out.width="675px", echo=FALSE,fig.cap="Figure 1: A standard $I-V$ curve and $I-V$ features. $I-V$ curve shows the relationship between current($I$) and voltage ($V$). $I-V$ features are maximum power point ($P_{mp}$), short-circuit current ($I_{sc}$), open-circuit voltage ($V_{oc}$), shunt resistance ($R_{sh}$), series resistance ($R_s$), and fill factor ($FF$)"----
knitr::include_graphics("IVparam.jpg")

## ---- message=FALSE, eval=TRUE-------------------------------------------

library(ddiv)
## Use the example IV curve data that has two steps
## Load the IV curve data set
data(IV_step2)
IV2 <- data.frame(IV_step2)
#?IV_step2

## Calculate number of steps in IV curve
IVsteps(IV2$I,IV2$V,plot.option=F)

## Extract two sets of IV features for each sub IV curves
IVExtractResult(IV2,plot.option=F)


