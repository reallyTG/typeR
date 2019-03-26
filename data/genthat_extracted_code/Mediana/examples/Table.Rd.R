library(Mediana)


### Name: Table
### Title: Table object
### Aliases: Table

### ** Examples

# Reporting
presentation.model = PresentationModel() +
  Section(by = "outcome.parameter") +
  Table(by = "sample.size") +
  CustomLabel(param = "sample.size",
              label= paste0("N = ",c(50, 55, 60, 65, 70))) +
  CustomLabel(param = "outcome.parameter",
              label=c("Standard 1", "Standard 2"))

# In this report, one section will be created for each outcome parameter assumption.
# The tables presented within each section will be sorted by sample size.



