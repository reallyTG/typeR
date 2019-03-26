library(Mediana)


### Name: CustomLabel
### Title: CustomLabel object
### Aliases: CustomLabel

### ** Examples

## Create a PresentationModel object with customized label
presentation.model = PresentationModel() +
  Section(by = "outcome.parameter") +
  Table(by = "sample.size") +
  CustomLabel(param = "sample.size",
              label= paste0("N = ",c(50, 55, 60, 65, 70))) +
  CustomLabel(param = "outcome.parameter", label=c("Standard 1", "Standard 2"))



