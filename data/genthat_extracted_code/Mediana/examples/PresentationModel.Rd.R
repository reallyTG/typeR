library(Mediana)


### Name: PresentationModel
### Title: PresentationModel object
### Aliases: PresentationModel

### ** Examples

presentation.model = PresentationModel() +
  Project(username = "Gautier Paux",
          title = "Clinical trial",
          description = "Simulation report for my clinical trial") +
  Section(by = "outcome.parameter") +
  Table(by = "sample.size") +
  CustomLabel(param = "sample.size",
              label= paste0("N = ",c(50, 55, 60, 65, 70))) +
  CustomLabel(param = "outcome.parameter",
              label=c("Standard 1", "Standard 2"))



