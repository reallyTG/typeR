library(Mediana)


### Name: MultAdj
### Title: MultAdj object
### Aliases: MultAdj

### ** Examples

# Multiplicity adjustments
mult.adj1 = MultAdjProc(proc = NA)
mult.adj2 = MultAdjProc(proc = "BonferroniAdj")
mult.adj3 = MultAdjProc(proc = "HolmAdj", par = parameters(weight = rep(1/3,3)))
mult.adj4 = MultAdjProc(proc = "HochbergAdj", par = parameters(weight = c(1/4,1/4,1/2)))


# Analysis model
analysis.model = AnalysisModel() +
                 MultAdj(mult.adj1, mult.adj2, mult.adj3, mult.adj4) +
                 Test(id = "Pl vs Dose L",
                      samples = samples("Placebo", "Dose L"),
                      method = "TTest") +
                 Test(id = "Pl vs Dose M",
                      samples = samples ("Placebo", "Dose M"),
                      method = "TTest") +
                 Test(id = "Pl vs Dose H",
                      samples = samples("Placebo", "Dose H"),
                      method = "TTest")

# Equivalent to:
analysis.model = AnalysisModel() +
                 mult.adj1 +
                 mult.adj2 +
                 mult.adj3 +
                 mult.adj4 +
                 Test(id = "Pl vs Dose L",
                      samples = samples("Placebo", "Dose L"),
                      method = "TTest") +
                 Test(id = "Pl vs Dose M",
                      samples = samples ("Placebo", "Dose M"),
                      method = "TTest") +
                 Test(id = "Pl vs Dose H",
                      samples = samples("Placebo", "Dose H"),
                      method = "TTest")




