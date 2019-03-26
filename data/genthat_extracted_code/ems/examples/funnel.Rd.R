library(ems)


### Name: funnel
### Title: Funnel plot for benchmarking health units
### Aliases: funnel print.funnel plot.funnel rateFunnel changeRateFunnel
###   propFunnel changePropFunnel

### ** Examples

# Loading data
data(icu)

# Some edition
icu$Saps3DeathProbabilityStandardEquation <- icu$Saps3DeathProbabilityStandardEquation / 100
icu <- icu[-which(icu$Unit == "F"),]
icu$myunits <- ifelse(icu$Unit == "A",1,0) #my units
icu <- droplevels(icu)

# Getting the cross-sectional arguments to use in funnel
x <- SMR.table(data = icu, group.var = "Unit",
              obs.var = "UnitDischargeName", pred.var = "Saps3DeathProbabilityStandardEquation")
myunit_names <- unique(icu$Unit[which(icu$myunits == 1)])
x$myunits <- ifelse(x$Levels %in% myunit_names, 1,0)

# Analysis of proportions
f1 <- funnel(unit = x$Levels[-1], o = x[-1,]$Observed, theta = x$Observed[1] / x$N[1],
            n = x[-1,]$N, method = "exact", myunits = x$myunits[-1], option = "prop", plot = FALSE)
f1
plot(f1, main = "Cross-sectional proportions")

# To analyze rates (SMR)
f2 <- funnel(unit = x$Levels[-1], y = x[-1,]$SMR, method = "exact", direct = TRUE,
            theta = x$SMR[1], e = x[-1,]$Expected, n = x[-1,]$N, o = x[-1,]$Observed,
            option = "rate", plot = FALSE)
f2
plot(f2, main = "Cross-sectional rate (SMR)")

# Creating a variable containing month information about each admission
icu$month <- as.numeric(format(as.Date(icu$UnitAdmissionDateTime),"%m"))

# First quarter
dt1 <- icu[which(icu$month %in% c(1,2,3)),]

# Second quarter
dt2 <- icu[which(icu$month %in% c(4,5,6)),]

# Getting the two period arguments to use in funnel
z <- SMR.table(data = dt1, group.var = "Unit", obs.var = "UnitDischargeName",
              pred.var = "Saps3DeathProbabilityStandardEquation")
w <- SMR.table(data = dt2, group.var = "Unit", obs.var = "UnitDischargeName",
              pred.var = "Saps3DeathProbabilityStandardEquation")

z$myunits <- ifelse(z$Levels %in% myunit_names, 1,0)
w$myunits <- ifelse(w$Levels %in% myunit_names, 1,0)
# To analyze periods using ratio rates with e1 = e1
f3 <- funnel(unit = z$Levels[-1], n1 = z$N[-1], o1 = z$Observed[-1],
            e1 = z$Expected[-1],
            n2 = w$N[-1], o2 = w$Observed[-1], e2 = z$Expected[-1],
            myunits = z$myunits[-1], option = "ratioRates", plot = FALSE)
f3
plot(f3, main = "Ratio of SMRs of periods with same expectation of death")


# To analyze periods using ratio rates with e1 =! e1
f4 <- funnel(unit <- z$Levels[-1], n1 = z$N[-1], o1 = z$Observed[-1],
            e1 = z$Expected[-1], n2 = w$N[-1], o2 = w$Observed[-1], e2 = w$Expected[-1],
            option = "ratioRates", plot = FALSE)
f4
plot(f4, main = "Ratio of SMRs of periods with different expectation of death",
    ylim = c(-1.5,1.5), xlim = c(0,200))

# To analyze periods by difference in proportions
f5 <- funnel(unit <- z$Levels[-1], n1 = z$N[-1], o1 = z$Observed[-1],
            n2 = w$N[-1], o2 = w$Observed[-1], option = "diffProp", plot = FALSE)
f5
plot(f5, main = "Difference in proportions of death for two periods")

# To analyze periods by ratio of proportions
f6 <- funnel(unit <- z$Levels[-1], n1 = z$N[-1], o1 = z$Observed[-1],
            n2 = w$N[-1], o2 = w$Observed[-1], option = "ratioProp", plot = FALSE)
f6
plot(f6, main = "Ratio of proportions of death for two periods")

rm(icu, x, z, w, dt1, dt2, unit, f1, f2, f3, f4, f5, f6)




