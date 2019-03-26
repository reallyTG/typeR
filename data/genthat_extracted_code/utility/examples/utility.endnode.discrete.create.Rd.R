library(utility)


### Name: utility.endnode.discrete.create
### Title: Construct a discrete value or utility end node
### Aliases: utility.endnode.discrete.create

### ** Examples

  widthvar <- 
    utility.endnode.discrete.create(
      name.node     = "width variability",
      attrib.levels = data.frame(widthvariability_class=
                                 c("high","moderate","none")),
      u             = c(1,0.4125,0),
      names.u       = c("u.high","u_moderate","u.none"),
      required      = FALSE,
      utility       = FALSE)

  print(widthvar)
  plot(widthvar)



