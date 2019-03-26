library(survminer)


### Name: ggcoxdiagnostics
### Title: Diagnostic Plots for Cox Proportional Hazards Model with ggplot2
### Aliases: ggcoxdiagnostics

### ** Examples


library(survival)
coxph.fit2 <- coxph(Surv(futime, fustat) ~ age + ecog.ps, data=ovarian)
ggcoxdiagnostics(coxph.fit2, type = "deviance")

ggcoxdiagnostics(coxph.fit2, type = "schoenfeld", title = "Diagnostic plot")
ggcoxdiagnostics(coxph.fit2, type = "deviance", ox.scale = "time")
ggcoxdiagnostics(coxph.fit2, type = "schoenfeld", ox.scale = "time",
                 title = "Diagnostic plot", subtitle = "Data comes from survey XYZ",
                 font.subtitle = 9)
ggcoxdiagnostics(coxph.fit2, type = "deviance", ox.scale = "linear.predictions",
                 caption = "Code is available here - link", font.caption = 10)
ggcoxdiagnostics(coxph.fit2, type = "schoenfeld", ox.scale = "observation.id")
ggcoxdiagnostics(coxph.fit2, type = "scaledsch", ox.scale = "time")




