library(PTXQC)


### Name: mosaicize
### Title: Prepare a Mosaic plot of two columns in long format.
### Aliases: mosaicize

### ** Examples

  data = data.frame(raw.file = c(rep('file A', 100), rep('file B', 40)),
                    charge = c(rep(2, 60), rep(3, 30), rep(4, 10),
                               rep(2, 30), rep(3, 7), rep(4, 3)))
  mosaicize(data)                             
  



