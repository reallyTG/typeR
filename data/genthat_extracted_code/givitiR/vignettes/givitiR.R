## ---- fig.width=6, fig.height=6, fig.align='center'----------------------
library(givitiR)
data("icuData")
cb <- givitiCalibrationBelt(o = icuData$outcome, e = icuData$probSaps,
                            devel = "external")
plot(cb, main = "SAPSII calibration",
                          xlab = "SAPSII predicted probability",
                          ylab = "Observed mortality")

## ---- fig.width=6, fig.height=6, fig.align='center'----------------------
plot(cb, main = "SAPSII calibration",
     xlab = "SAPSII predicted probability",
     ylab = "Observed mortality",
     xlim = c(0.55,1), ylim = c(0.2,1))

## ------------------------------------------------------------------------
givitiCalibrationTest(o = icuData$outcome, e = icuData$probSaps,
                            devel = "external")

## ------------------------------------------------------------------------
formulaSAPS <- formula(outcome ~ relevel(adm,'schSurg') + relevel(chronic,'noChronDis') +
                          relevel(age,'<40') + relevel(gcs,'14-15') +
                          relevel(BP,'100-199') + relevel(HR,'70-119') +
                          relevel(temp,'<39') + relevel(urine,'>=1') +
                          relevel(urea,'<0.60') + relevel(WBC,'1-19') +
                          relevel(potassium,'3-4.9') + relevel(sodium,'125-144') +
                          relevel(HCO3,'>=20') + relevel(bili,'<4') +
                          relevel(paFiIfVent,'noVent') )

refittedSaps <- glm(formula = formulaSAPS, family=binomial(link='logit'),
                    na.action = na.exclude, data = icuData)

icuData$probRefittedSaps <- predict(refittedSaps, type = "response")

## ---- fig.width=6, fig.height=6, fig.align='center'----------------------
cbInternal <- givitiCalibrationBelt(o = icuData$outcome, icuData$probRefittedSaps,
                            devel = "internal")
plot(cbInternal, main = "Refitted SAPSII calibration",
     xlab = "Refitted SAPSII predicted probability",
     ylab = "Observed mortality")

## ------------------------------------------------------------------------
givitiCalibrationTest(o = icuData$outcome, e = icuData$probRefittedSaps,
                            devel = "internal")

