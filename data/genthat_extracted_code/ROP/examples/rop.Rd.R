library(ROP)


### Name: rop
### Title: Launch of the analysis
### Aliases: rop
### Keywords: package

### ** Examples

rop(
  fic = system.file("extdata", "titanic.csv", package = "ROP"),
  output_folder = tempdir(),
  mini = -1,
  maxi = 1,
  nbCycles = 2,
  typesVariables = c(FALSE, FALSE, FALSE)
)




