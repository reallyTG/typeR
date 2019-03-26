library(abd)


### Name: SticklebackPlates
### Title: Number of Lateral Plates in Sticklebacks
### Aliases: SticklebackPlates
### Keywords: datasets

### ** Examples

aggregate(plates ~ genotype, SticklebackPlates, FUN = favstats)

histogram( ~ plates | genotype, SticklebackPlates,
  layout = c(1,3),
  n = 15,
  xlab = "Number of Lateral Body Plates"
  )

densityplot( ~ plates | genotype, SticklebackPlates,
  xlab = "Number of Lateral Body Plates",
  layout = c(1,3)
  )



