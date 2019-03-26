library(pcnetmeta)


### Name: nma.networkplot
### Title: Plotting the Network
### Aliases: nma.networkplot

### ** Examples

data(smoke)
nma.networkplot(s.id, t.id, data = smoke, title = "Smoke Cessation",
  trtname = c("NC", "SH", "IC", "GC"))
# NC: No contact; SH: Self-help
# IC: individual counselling; GC: group counselling

data(diabetes)
nma.networkplot(s.id, t.id, data = diabetes, title = "Diabetes",
  trtname = c("Diuretic", "Placebo", "b-blocker", "CCB", "ACE inhibitor",
  "ARB"))



