library(utility)


### Name: utility.endnode.cond.create
### Title: Construct a conditional end node
### Aliases: utility.endnode.cond.create

### ** Examples

  bedmod_riprap <-
    utility.endnode.intpol1d.create(
      name.node   = "bed modification riprap",
      name.attrib = "bedmodfract_percent",
      range       = c(0,100),
      x           = c(0,10,30,100),
      u           = c(1,0.775,0.5625,0.24),
      required    = FALSE,
      utility     = FALSE)
  
  bedmod_other <-
    utility.endnode.intpol1d.create(
      name.node   = "bed modification other",
      name.attrib = "bedmodfract_percent",
      range       = c(0,100),
      x           = c(0,10,30,100),
      u           = c(1,0.775,0.5625,0),
      required    = FALSE,
      utility     = FALSE)
  
  bedmod <-
    utility.endnode.cond.create(
      name.node     = "bed modification",
      attrib.levels = data.frame(bedmodtype_class=
                                 c("riprap","other")),
      nodes         = list(bedmod_riprap,bedmod_other),
      required      = FALSE,
      utility       = FALSE)

  print(bedmod)
  plot(bedmod)



