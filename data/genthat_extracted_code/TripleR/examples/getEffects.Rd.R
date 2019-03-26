library(TripleR)


### Name: getEffects
### Title: Calculates round robin effects for multiple variables
### Aliases: getEffects

### ** Examples


data(likingLong)
res <- getEffects(~perceiver.id*target.id, 
				  data=likingLong, 
				  varlist=c("liking_a", "liking_b", "metaliking_a", "metaliking_b"))
str(res)

# effects including group means:
res.gm <- getEffects(~perceiver.id*target.id, 
				  data=likingLong, gm=TRUE,
				  varlist=c("liking_a", "liking_b", "metaliking_a", "metaliking_b"))
str(res.gm)


# Multipe groups
#-----------------------
data("multiLikingLong")

res.g <- getEffects(~perceiver.id*target.id|group.id, 
				  data=multiLikingLong, 
				  varlist=c("liking_a", "liking_b", "metaliking_a", "metaliking_b"))
str(res.g)

# effects including group means:
res.g.gm <- getEffects(~perceiver.id*target.id|group.id, 
				  data=multiLikingLong, gm=TRUE,
				  varlist=c("liking_a", "liking_b", "metaliking_a", "metaliking_b"))
str(res.g.gm)




