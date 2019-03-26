library(abd)


### Name: TeenDeaths
### Title: Causes of Teenage Deaths
### Aliases: TeenDeaths
### Keywords: datasets

### ** Examples

str(TeenDeaths)
TeenDeaths

barchart(deaths ~ cause, TeenDeaths,
  horizontal = FALSE,
  ylab = "Number of Deaths",
  xlab = "Cause of Death", origin=0,
  scales = list(x = list(rot=45)))

barchart(deaths~ordered(cause, levels=cause), TeenDeaths,
  horizontal = FALSE,
  ylab = "Number of Deaths",
  xlab = "Cause of Death", origin=0,
  scales=list(x=list(rot=45))
  )



