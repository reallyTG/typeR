library(utility)


### Name: utility.endnode.parfun1d.create
### Title: Construct a single-attribute parametric function end node
### Aliases: utility.endnode.parfun1d.create

### ** Examples

  bedmod_other <-
    utility.endnode.parfun1d.create(
      name.node   = "bed modification other",
      name.attrib = "bedmodfract_percent",
      range       = c(0,100),
      name.fun    = "utility.fun.exp",
      par         = c(-1,100,0),
      required    = FALSE,
      utility     = FALSE)
      
  print(bedmod_other)
  plot(bedmod_other)



