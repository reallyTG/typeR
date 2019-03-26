library(pairwiseCI)


### Name: as.data.frame.pairwiseCI
### Title: Coercing pairwiseCI objects to data.frames
### Aliases: as.data.frame.pairwiseCI
### Keywords: misc

### ** Examples



data(repellent)

out2<-pairwiseCI(decrease~treatment, data=repellent, control="H",
 alternative="two.sided", method="Param.diff")

out2

as.data.frame(out2)






