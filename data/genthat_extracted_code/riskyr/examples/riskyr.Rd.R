library(riskyr)


### Name: riskyr
### Title: Create riskyr scenarios.
### Aliases: riskyr

### ** Examples

# Defining a scenario:
custom.scenario <- riskyr(scen.lbl = "Identify reoffenders",
  cond.lbl = "Being a reoffender", popu.lbl = "Prisoners",
  cond.true.lbl = "Has reoffended", cond.false.lbl = "Has not reoffended",
  dec.lbl = "Test result",
  dec.pos.lbl = "will reoffend", dec.neg.lbl = "will not reoffend",
  hi.lbl = "Reoffender found", mi.lbl = "Reoffender missed",
  fa.lbl = "False accusation", cr.lbl = "Correct release",
  prev = .45,  # prevalence of being a reoffender.
  sens = .98, spec = .46, fart = NA, N = 753,
  scen.src = "Ficticious example scenario")

# Using a scenario:
summary(custom.scenario)
plot(custom.scenario)




