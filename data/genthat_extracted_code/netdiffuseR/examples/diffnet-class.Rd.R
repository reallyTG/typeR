library(netdiffuseR)


### Name: diffnet-class
### Title: Creates a 'diffnet' class object
### Aliases: diffnet-class diffnet as_diffnet as_diffnet.default
###   as_diffnet.networkDynamic new_diffnet as.data.frame.diffnet
###   diffnet.attrs diffnet.attrs<- diffnet.toa diffnet.toa<- print.diffnet
###   nodes diffnetLapply str.diffnet dimnames.diffnet t.diffnet
###   dim.diffnet

### ** Examples


# Creating a random graph
set.seed(123)
graph <- rgraph_ba(t=9)
graph <- lapply(1:5, function(x) graph)

# Pretty TOA
names(graph) <- 2001L:2005L
toa <- sample(c(2001L:2005L,NA), 10, TRUE)

# Creating diffnet object
diffnet <- new_diffnet(graph, toa)
diffnet
summary(diffnet)

# Plotting slice 4
plot(diffnet, t=4)

# ATTRIBUTES ----------------------------------------------------------------

# Retrieving attributes
diffnet.attrs(diffnet, "vertex", "static")

# Now as a data.frame (only static)
diffnet.attrs(diffnet, "vertex", "static", as.df = TRUE)

# Now as a data.frame (all of them)
diffnet.attrs(diffnet, as.df = TRUE)
as.data.frame(diffnet) # This is a wrapper

# Unsorted data -------------------------------------------------------------
# Loading example data
data(fakesurveyDyn)

# Creating a diffnet object
fs_diffnet <- survey_to_diffnet(
   fakesurveyDyn, "id", c("net1", "net2", "net3"), "toa", "group",
   timevar = "time", keep.isolates=TRUE, warn.coercion=FALSE)

# Now, we extract the graph data and create a diffnet object from scratch
graph <- fs_diffnet$graph
ids <- fs_diffnet$meta$ids
graph <- Map(function(g) {
  dimnames(g) <- list(ids,ids)
  g
  }, g=graph)
attrs <- diffnet.attrs(fs_diffnet, as.df=TRUE)
toa   <- diffnet.toa(fs_diffnet)

# Lets apply a different sorting to the data to see if it works
n <- nrow(attrs)
attrs <- attrs[order(runif(n)),]

# Now, recreating the old diffnet object (notice -id.and.per.vars- arg)
fs_diffnet_new <- new_diffnet(graph, toa=toa, vertex.dyn.attrs=attrs,
   id.and.per.vars = c("id", "per"))

# Now, retrieving attributes. The 'new one' will have more (repeated)
attrs_new <- diffnet.attrs(fs_diffnet_new, as.df=TRUE)
attrs_old <- diffnet.attrs(fs_diffnet, as.df=TRUE)

# Comparing elements!
tocompare <- intersect(colnames(attrs_new), colnames(attrs_old))
all(attrs_new[,tocompare] == attrs_old[,tocompare], na.rm = TRUE) # TRUE!

# diffnetLapply -------------------------------------------------------------

data(medInnovationsDiffNet)
diffnetLapply(medInnovationsDiffNet, function(x, cumadopt, ...) {sum(cumadopt)})




