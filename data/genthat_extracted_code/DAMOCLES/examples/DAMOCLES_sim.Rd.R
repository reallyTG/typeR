library(DAMOCLES)


### Name: DAMOCLES_sim
### Title: Simulating DAMOCLES
### Aliases: DAMOCLES_sim
### Keywords: models

### ** Examples

#create random phylogeny
phy = rcoal(10)
		
#run DAMOCLES		
out = DAMOCLES_sim(
  phy,
  gamma_0 = 1.5,
  gamma_td =0,
  mu = 0,
  sigma = 0,
  psiBranch = 0,
  psiTrait = 0,
  z = 10,
  phi = 0,
  traitOpt = 1,
  br0 = 0.1,
  br_td = -0.1,
  nTdim = 2,
  root.state = 1,
  root.trait.state = 0,
  plotit = FALSE,
  keepExtinct = FALSE
  )

#the output consists of a list		
patable = out[[1]] # the first element is the presence absence table
traits = out[[2]] # this is a matrix of traits values

#show presence/absence on the tree
patable$col = rep("black",dim(patable)[1])
patable$col[which(patable$state == 1)] = "red"
plot(phy,tip.col = patable$col)



