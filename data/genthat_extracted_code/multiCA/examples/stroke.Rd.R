library(multiCA)


### Name: stroke
### Title: Stroke types over time
### Aliases: stroke
### Keywords: datasets

### ** Examples

data(stroke)
xtabs(Freq ~ Type + Year, data=stroke)

strk.props <- prop.table(xtabs(Freq ~ Year+Type, data=stroke), margin=1)
matplot(strk.props, type="l")



