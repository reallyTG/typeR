library(spatstat)


### Name: fasp.object
### Title: Function Arrays for Spatial Patterns
### Aliases: fasp.object
### Keywords: spatial attribute

### ** Examples

  # multitype point pattern
  data(amacrine)
  GG <- alltypes(amacrine, "G")
  plot(GG)

  # select the row corresponding to cells of type "on"
  Gon <- GG["on", ]
  plot(Gon)

  # extract the G function for i = "on", j = "off"
  Gonoff <- GG["on", "off", drop=TRUE]

  # Fisher variance stabilising transformation
  GGfish <- eval.fasp(asin(sqrt(GG)))
  plot(GGfish)



