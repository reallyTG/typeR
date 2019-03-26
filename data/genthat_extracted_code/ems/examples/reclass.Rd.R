library(ems)


### Name: reclass
### Title: Comparisson of the Standardized Resource Use (SRU)
### Aliases: reclass print.reclass plot.reclass

### ** Examples


data(icu)
# A little editing
icu$Saps3DeathProbabilityStandardEquation <- icu$Saps3DeathProbabilityStandardEquation / 100
icu <- icu[-which(icu$los < 0 ),]

# Subseting the data for the 1st quarter
x <- droplevels(icu[which(format(as.Date(icu$UnitAdmissionDate),"%m") %in% c("01","02","03")),])

# Subseting the data for the 2nd quarter
y <- droplevels(icu[which(format(as.Date(icu$UnitAdmissionDate),"%m") %in% c("04","05","06")),])

# Running the SRU analysis for both quarters
FirstQ <- SRU(prob = x$Saps3DeathProbabilityStandardEquation, death = x$UnitDischargeName,
unit = x$Unit, los = x$los, score = x$Saps3Points, originals = TRUE, type = 1, plot = FALSE)
FirstQ

SecondQ <- SRU(prob = y$Saps3DeathProbabilityStandardEquation, death = y$UnitDischargeName,
unit = y$Unit, los = y$los, score = y$Saps3Points, originals = TRUE, type = 1, plot = FALSE)
SecondQ

z <- reclass(x = FirstQ, y = SecondQ, same = TRUE)
z
plot(z)

rm(icu, x, y, FirstQ, SecondQ, z)




