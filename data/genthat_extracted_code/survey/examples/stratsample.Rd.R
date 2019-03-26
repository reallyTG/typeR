library(survey)


### Name: stratsample
### Title: Take a stratified sample
### Aliases: stratsample
### Keywords: survey

### ** Examples

  data(api)
  s<-stratsample(apipop$stype, c("E"=5,"H"=4,"M"=2))
  table(apipop$stype[s])



