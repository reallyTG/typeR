library(ParamHelpers)


### Name: filterParams
### Title: Get parameter subset of only certain parameters.
### Aliases: filterParams filterParamsNumeric filterParamsDiscrete

### ** Examples

ps = makeParamSet(
  makeNumericParam("u", lower = 1),
  makeIntegerParam("v", lower = 1, upper = 2),
  makeDiscreteParam("w", values = 1:2),
  makeLogicalParam("x"),
  makeCharacterParam("s"),
  makeNumericParam("y", tunable = FALSE)
)

# filter for numeric and integer parameters
filterParams(ps, type = c("integer", "numeric"))

# filter for tunable, numeric parameters
filterParams(ps, type = "numeric", tunable = TRUE)

# filter for all numeric parameters among "u", "v" and "x"
filterParams(ps, type = "numeric", ids = c("u", "v", "x"))



