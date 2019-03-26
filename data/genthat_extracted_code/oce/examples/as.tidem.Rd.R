library(oce)


### Name: as.tidem
### Title: Create tidem object from fitted harmonic data
### Aliases: as.tidem

### ** Examples

# Simulate a tide table with output from tidem().
data(sealevelTuktoyaktuk)
# 'm0' is model fitted by tidem()
m0 <- tidem(sealevelTuktoyaktuk)
p0 <- predict(m0, sealevelTuktoyaktuk[["time"]])
m1 <- as.tidem(mean(sealevelTuktoyaktuk[["time"]]), sealevelTuktoyaktuk[["latitude"]],
               m0[["name"]], m0[["amplitude"]], m0[["phase"]])
# Test agreement with tidem() result, by comparing predicted sealevels.
p1 <- predict(m1, sealevelTuktoyaktuk[["time"]])
expect_lt(max(abs(p1 - p0), na.rm=TRUE), 1e-10)
# Simplified harmonic model, using large constituents
# > m0[["name"]][which(m[["amplitude"]]>0.05)]
# [1] "Z0"  "MM"  "MSF" "O1"  "K1"  "OO1" "N2"  "M2"  "S2"
h <- "
name  amplitude      phase
  Z0 1.98061875   0.000000
  MM 0.21213065 263.344739
 MSF 0.15605629 133.795004
  O1 0.07641438  74.233130
  K1 0.13473817  81.093134
 OO1 0.05309911 235.749693
  N2 0.08377108  44.521462
  M2 0.49041340  77.703594
  S2 0.22023705 137.475767"
coef <- read.table(text=h, header=TRUE)
m2 <- as.tidem(mean(sealevelTuktoyaktuk[["time"]]),
               sealevelTuktoyaktuk[["latitude"]],
               coef$name, coef$amplitude, coef$phase)
p2 <- predict(m2, sealevelTuktoyaktuk[["time"]])
expect_lt(max(abs(p2 - p0), na.rm=TRUE), 1)
par(mfrow=c(3, 1))
oce.plot.ts(sealevelTuktoyaktuk[["time"]], p0)
ylim <- par("usr")[3:4] # to match scales in other panels
oce.plot.ts(sealevelTuktoyaktuk[["time"]], p1, ylim=ylim)
oce.plot.ts(sealevelTuktoyaktuk[["time"]], p2, ylim=ylim)



