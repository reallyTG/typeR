library(Mediana)


### Name: Subsection
### Title: Subsection object
### Aliases: Subsection

### ** Examples

# Reporting
presentation.model = PresentationModel() +
  Section(by = "outcome.parameter") +
  Subsection(by = "sample.size") +
  CustomLabel(param = "sample.size",
              label= paste0("N = ",c(50, 55, 60, 65, 70))) +
  CustomLabel(param = "outcome.parameter",
              label=c("Standard 1", "Standard 2"))

# In this report, one section will be created for each outcome parameter assumption
# and within each section, a subsection will be created for each sample size.




