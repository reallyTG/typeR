library(VCA)


### Name: buildList
### Title: Build a Nested List.
### Aliases: buildList

### ** Examples


# load data (CLSI EP05-A2 Within-Lab Precision Experiment)
data(dataEP05A2_3)

# build a list representing the hierarichal structure of a fully-nested model
# there needs to be a distinct hierarchy for being able to plot the data
# as variability chart (this function is not exported)
## Not run: 
##D lst <- VCA:::buildList(Data=dataEP05A2_3, Nesting=c("day", "run"), Current="day", resp="y")
## End(Not run)



