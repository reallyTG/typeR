library(multicon)


### Name: vector.alpha
### Title: Alpha Replicability of a Vector (pattern) of Correlations
### Aliases: vector.alpha
### Keywords: replicability alpha

### ** Examples

data(RSPdata)
	# Is the pattern of relationships between self reported 
	#extraversion and behavior replicable?
RSPdata$sEXT
data(beh.comp)
head(beh.comp)
vector.alpha(RSPdata$sEXT, beh.comp) #alpha = .666
	# Might also try vector.splithalf
vector.splithalf(RSPdata$sEXT,beh.comp) # split-half reliability = .684



