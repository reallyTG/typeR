library(survminer)


### Name: BMT
### Title: Bone Marrow Transplant
### Aliases: BMT

### ** Examples

data(BMT)

# Data preparaion
#+++++++++++++++++++++
# Label diseases
BMT$dis <- factor(BMT$dis, levels = c(0,1),
   labels = c("ALL", "AML"))
# Label status
BMT$status <- factor(BMT$status, levels = c(0,1,2),
  labels = c("Censored","Mortality","Relapse"))

# Cumulative Incidence Function
# ++++++++++++++++++++++++++
fit <- cmprsk::cuminc(
  ftime = BMT$ftime,      # Failure time variable
  fstatus = BMT$status,   # Codes for different causes of failure
  group = BMT$dis         # Estimates will calculated within groups
 )

# Visualize
# +++++++++++++++++++++++
ggcompetingrisks(fit)
ggcompetingrisks(fit, multiple_panels = FALSE,
  legend = "right")




