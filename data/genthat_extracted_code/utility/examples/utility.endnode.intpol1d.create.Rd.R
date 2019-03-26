library(utility)


### Name: utility.endnode.intpol1d.create
### Title: Construct a single-attribute interpolation end node
### Aliases: utility.endnode.intpol1d.create

### ** Examples

  bedmod_other <-
    utility.endnode.intpol1d.create(
      name.node   = "bed modification other",
      name.attrib = "bedmodfract_percent",
      range       = c(0,100),
      x           = c(0,10,30,100),
      u           = c(1,0.775,0.5625,0),
      required    = FALSE,
      utility     = FALSE)
      
  print(bedmod_other)
  plot(bedmod_other)



