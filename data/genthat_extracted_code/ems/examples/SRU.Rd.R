library(ems)


### Name: SRU
### Title: Standardized Resource Use (SRU)
### Aliases: SRU print.SRU plot.SRU cut_in SRUcalc

### ** Examples


# Loading the dataset
data(icu)

# Removing data with inapropriate values and some editing
icu <- icu[-which(icu$los < 0 ),]
icu$Saps3DeathProbabilityStandardEquation <- icu$Saps3DeathProbabilityStandardEquation / 100

# Setting classes acording to limits of SAPS 3 score
days <- seq(1,100)
cut_lims <- cut_in(icu$Saps3Points, icu$los, icu$UnitDischargeName,
                   icu$Unit, days, exc.ICU = TRUE)
icu$class <- cut(icu$Saps3Points, breaks = cut_lims, include.lowest = TRUE)

# Estimating the SRU benchmarking myunit A and B
x <- SRU(prob = icu$Saps3DeathProbabilityStandardEquation,
death = icu$UnitDischargeName, unit = icu$Unit,
los = icu$los, score = icu$Saps3Points,
originals = TRUE, type = 1, plot = FALSE, myunits = c("A","B"))
x
plot(x)

# To see the units rankings and individual SMR and SRU, ordering by its SRU
x$rates[order(x$rates$sru),]

# SRU with diferent severity classes created by cut_in function
y <- SRU(prob = icu$Saps3DeathProbabilityStandardEquation,
death = icu$UnitDischargeName, unit = icu$Unit,
los = icu$los, score = icu$Saps3Points,
originals = FALSE, type = 1, plot = FALSE, class = icu$class)
y

# Using SRUcalc
SRUcalc(prob = icu$Saps3DeathProbabilityStandardEquation,
        death = icu$UnitDischargeName, unit = icu$Unit, los = icu$los,
        score = icu$Saps3Points)

rm(x, y, days, icu, cut_lims)




