library(strap)


### Name: geoscalePhylo
### Title: Plots a phylogeny against the geological time scale.
### Aliases: geoscalePhylo
### Keywords: time scale, geological, plot, phylogeny, tree

### ** Examples


### Example lungfish data
data(Dipnoi)

tree_l <- DatePhylo(Dipnoi$tree, Dipnoi$ages, method="equal", rlen=1)

geoscalePhylo(tree=tree_l, boxes="Age", cex.tip=0.4)

# Plotting the tree with the stratigraphical ranges included

geoscalePhylo(tree=tree_l, ages=Dipnoi$ages, boxes="Age", cex.tip=0.4)

# Including all temporal units into the stratigraphic column

geoscalePhylo(tree_l, Dipnoi$ages, units = c("Eon","Era","Period","Epoch","Age"),
  boxes="Age", cex.tip=0.4)

# Plotting the numerical values on the time scale at Age resolution

geoscalePhylo(tree_l, Dipnoi$ages, units = c("Eon","Era","Period","Epoch","Age"),
  boxes="Age", cex.tip=0.4,tick.scale="Age")

### Example trilobite data
data(Asaphidae)

tree_a <- DatePhylo(Asaphidae$trees[[1]], Asaphidae$ages, method="equal", rlen=1)

geoscalePhylo(ladderize(tree_a), Asaphidae$ages, boxes="Age", x.lim=c(504,435), 
  cex.tip=0.5, cex.ts=0.5,vers="ICS2009") 

# Plotting the tree vertically

geoscalePhylo(ladderize(tree_a), Asaphidae$ages, boxes="Age", x.lim=c(504,435), 
  cex.tip=0.5, cex.ts=0.5,direction="upwards",vers="ICS2009") 

# Including a user-defined time scale

data(UKzones)
data(Asaphidae)

tree_a <- DatePhylo(Asaphidae$trees[[1]], Asaphidae$ages, method="equal", rlen=1)

geoscalePhylo(ladderize(tree_a), Asaphidae$ages, units = c("Eon","Era","Period",
  "Epoch","User"), boxes="Age", cex.tip=0.4,user.scale=UKzones,
  vers="ICS2009",cex.ts=0.5,x.lim=c(440),direction="upwards")

# Rotating the text on the time scale

tree_a <- DatePhylo(Asaphidae$trees[[1]], Asaphidae$ages, method="equal", rlen=1)

geoscalePhylo(ladderize(tree_a), Asaphidae$ages, units = c("Period",
  "Epoch","Age","User"), boxes="Age", cex.tip=0.4,user.scale=UKzones,
  vers="ICS2009",cex.ts=0.5,x.lim=c(440),arotate=0,erotate=0,urotate=0)




