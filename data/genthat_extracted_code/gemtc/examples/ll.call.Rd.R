library(gemtc)


### Name: ll.call
### Title: Call a likelihood/link-specific function
### Aliases: ll.call

### ** Examples

# The "model" may be a stub.
model <- list(likelihood="poisson", link="log")

ll.call("scale.name", model)
# "Hazard Ratio"

ll.call("mtc.arm.mle", model, c('responders'=12, 'exposure'=80))
#      mean         sd
#-1.8562980  0.1118034



