library(SimInf)


### Name: events
### Title: Extract the events from a 'SimInf_model' object
### Aliases: events

### ** Examples

## Create an SIR model that includes scheduled events.
model <- SIR(u0     = u0_SIR(),
             tspan  = 1:(4 * 365),
             events = events_SIR(),
             beta   = 0.16,
             gamma  = 0.077)

## Extract the scheduled events from the model and display summary
summary(events(model))

## Extract the scheduled events from the model and plot them
plot(events(model))



