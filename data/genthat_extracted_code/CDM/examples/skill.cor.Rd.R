library(CDM)


### Name: skill.cor
### Title: Tetrachoric or Polychoric Correlations between Attributes
### Aliases: skill.cor skill.polychor
### Keywords: Skill correlation

### ** Examples

data(sim.dino, package="CDM")
data(sim.qmatrix, package="CDM")

# estimate model
d4 <- CDM::din( sim.dino, q.matrix=sim.qmatrix)
# compute tetrachoric correlations
CDM::skill.cor(d4)
  ## estimated tetrachoric correlations
  ##   $cor.skills
  ##             V1        V2        V3
  ##   V1 1.0000000 0.2567718 0.2552958
  ##   V2 0.2567718 1.0000000 0.9842188
  ##   V3 0.2552958 0.9842188 1.0000000



