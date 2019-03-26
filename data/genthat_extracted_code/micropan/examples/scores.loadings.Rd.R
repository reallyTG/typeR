library(micropan)


### Name: plotScores
### Title: Plotting scores and loadings in a 'Panpca' object
### Aliases: plotScores plotLoadings

### ** Examples

# Loading a Panmat object in the micropan package
data(list=c("Mpneumoniae.blast.panmat","Mpneumoniae.domain.panmat"),package="micropan")
ppca.blast <- panpca(Mpneumoniae.blast.panmat)

# Plotting scores and loadings
plotScores(ppca.blast) # A score-plot
plotLoadings(ppca.blast) # A loading plot

# Plotting score with alternative labels and colors
data(list="Mpneumoniae.table",package="micropan")
labels <- Mpneumoniae.table$Strain
names(labels) <- Mpneumoniae.table$GID.tag
cols <- Mpneumoniae.table$Color
names(cols) <- Mpneumoniae.table$GID.tag
plotScores(ppca.blast,labels=labels,col=cols)




