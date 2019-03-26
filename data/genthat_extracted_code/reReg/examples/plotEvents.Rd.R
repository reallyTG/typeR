library(reReg)


### Name: plotEvents
### Title: Produce Event Plots
### Aliases: plotEvents
### Keywords: Plots

### ** Examples

data(readmission, package = "frailtypack")
plotEvents(reSurv(t.stop, id, event, death) ~ 1, data = readmission)

## Separate plots by gender
plotEvents(reSurv(t.stop, id, event, death) ~ sex, data = readmission)

## Separate plots by gender and chemo type
plotEvents(reSurv(t.stop, id, event, death) ~ sex + chemo, data = readmission)

## With multiple hypothetical event types
plotEvents(reSurv(t.stop, id, event * sample(1:3, 861, TRUE), death) ~
  sex + chemo, data = readmission)



