library(streambugs)


### Name: streambugs.example.model.toy
### Title: Set-up the streambugs toy model
### Aliases: streambugs.example.model.toy

### ** Examples

model <- streambugs.example.model.toy()
# display values of the exponent "q" in the food limitation term; Note:
model$par[grepl("(.*_)?q$", names(model$par))]




