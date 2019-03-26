library(processR)


### Name: pmacroModel
### Title: draw conceptual diagram of process macro model
### Aliases: pmacroModel

### ** Examples

covar=list(name=c("C1","C2","C3"),label=c("ese","sex","tenure"),site=list("M",c("M","Y"),c("Y")))
pmacroModel(4,covar=covar)
pmacroModel(1,covar=covar)
pmacroModel(1)



