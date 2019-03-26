library(utility)


### Name: utility.endnode.intpol2d.create
### Title: Construct a two-attribute interpolation end node
### Aliases: utility.endnode.intpol2d.create

### ** Examples

  riparzone_width <-
    utility.endnode.intpol2d.create(
      name.node   = "riparian zone width",
      name.attrib = c("riverbedwidth_m","riparianzonewidth_m"),
      ranges      = list(c(0,16),c(0,30)),
      isolines    = list(list(x=c(0,16),y=c(0,0)),
                         list(x=c(0,2,10,16),y=c(5,5,15,15)),
                         list(x=c(0,16),y=c(15,15)),
                         list(x=c(0,16),y=c(30,30))),
      u           = c(0.0,0.6,1.0,1.0),
      lead         = 1,
      utility      = FALSE)

  print(riparzone_width)
  plot(riparzone_width)



