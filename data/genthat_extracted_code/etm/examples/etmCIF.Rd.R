library(etm)


### Name: etmCIF
### Title: Cumulative incidence functions of competing risks
### Aliases: etmCIF
### Keywords: survival

### ** Examples


data(abortion)

cif.ab <- etmCIF(survival::Surv(entry, exit, cause != 0) ~ group, abortion,
                 etype = cause, failcode = 3)

cif.ab

plot(cif.ab, ci.type = "bars", pos.ci = 24,
     col = c(1, 2), lty = 1, curvlab = c("Control", "Exposed"))




