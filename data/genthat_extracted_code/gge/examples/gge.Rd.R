library(gge)


### Name: gge
### Title: GGE and GGB biplots
### Aliases: gge package-gge gge-package gge gge.formula gge.matrix
###   plot.gge biplot.gge biplot3d biplot3d.gge

### ** Examples

# Example 1.  Data is a data.frame in 'matrix' format
B <- matrix(c(50, 67, 90, 98, 120,
              55, 71, 93, 102, 129,
              65, 76, 95, 105, 134,
              50, 80, 102, 130, 138,
              60, 82, 97, 135, 151,
              65, 89, 106, 137, 153,
              75, 95, 117, 133, 155), ncol=5, byrow=TRUE)
rownames(B) <- c("G1","G2","G3","G4","G5","G6","G7")
colnames(B) <- c("E1","E2","E3","E4","E5")

m1 = gge(B)
plot(m1)
biplot(m1, main="Example biplot")
# biplot3d(m1)

if(require(agridat)){
  # crossa.wheat biplot

  # Specify env.group as column in data frame
  data(crossa.wheat)
  dat2 <- crossa.wheat
  dat2$eg <- ifelse(is.element(dat2$loc,
                               c("KN","NB","PA","BJ","IL","TC", "JM","PI","AS","ID","SC","SS",
                                 "SJ","MS","MG","MM")), "Grp1", "Grp2")
  m2 <- gge(yield~gen*loc, dat2, env.group=eg, scale=FALSE)
  plot(m2)
  biplot(m2, lab.env=TRUE, main="crossa.wheat")
  # biplot3d(m2)
}




