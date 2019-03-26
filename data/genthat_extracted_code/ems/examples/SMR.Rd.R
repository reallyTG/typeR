library(ems)


### Name: SMR
### Title: Standardized Mortality Ratio (SMR)
### Aliases: SMR SMR.table forest.SMR

### ** Examples

# Loading a example data
data(icu)

# Setting variable labels to data
attr(icu, "var.labels")[match(c("Unit", "IsMechanicalVentilation1h",
          "AdmissionTypeName_pri","Vasopressors_D1"), names(icu))] <-
  c("ICU unit","Mechanichal ventilation","Admission type","Vasopressors at admission")

# Some editing
icu$Saps3DeathProbabilityStandardEquation <- icu$Saps3DeathProbabilityStandardEquation /100
icu$IsMechanicalVentilation1h <- as.factor(ifelse(icu$IsMechanicalVentilation1h == 1, "Yes", "No"))
icu$AdmissionTypeName_pri <- as.factor(icu$AdmissionTypeName_pri)
levels(icu$AdmissionTypeName_pri) <- c("Clinical","Elective surgery", "Urgent surgery")
icu$Vasopressors_D1 <- as.factor(ifelse(icu$Vasopressors_D1 == 1, "Yes", "No"))

# The overall SMR for the whole sample
SMR(icu$UnitDischargeName, icu$Saps3DeathProbabilityStandardEquation)

# The overall SMR and for some subgroups
x <- SMR.table(data = icu, obs.var = "UnitDischargeName",
               pred.var = "Saps3DeathProbabilityStandardEquation",
               group.var = c( "IsMechanicalVentilation1h",
               "AdmissionTypeName_pri","Vasopressors_D1"),
               reorder = "no",
               decreasing = TRUE,
               use.label = TRUE)
x

# A forest plot for all groups SMR (resize the window may be required)
forest.SMR(x, digits = 2)

# The same thing but reordering the categories
x <- SMR.table(data = icu, obs.var = "UnitDischargeName",
               pred.var = "Saps3DeathProbabilityStandardEquation",
               group.var = c( "IsMechanicalVentilation1h",
               "AdmissionTypeName_pri", "Vasopressors_D1"),
               reorder = "SMR",
               decreasing = TRUE,
               use.label = TRUE)
forest.SMR(x, digits = 2)

# The overall SMR and for all Units
x <- SMR.table(data = icu, obs.var = "UnitDischargeName",
               pred.var = "Saps3DeathProbabilityStandardEquation",
               group.var = "Unit",
               reorder = "no",
               decreasing = TRUE,
               use.label = TRUE)
x

# A forest plot for all Units
forest.SMR(x, digits = 2)

# The same thing but reordering the categories
x <- SMR.table(data = icu, obs.var = "UnitDischargeName",
               pred.var = "Saps3DeathProbabilityStandardEquation",
               group.var = "Unit",
               reorder = "SMR",
               decreasing = TRUE,
               use.label = TRUE)
forest.SMR(x, digits = 2)

rm(x, icu)



