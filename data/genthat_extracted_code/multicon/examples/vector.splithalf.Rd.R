library(multicon)


### Name: vector.splithalf
### Title: Split-half Repicability of a Vector (pattern) of Correlations
### Aliases: vector.splithalf
### Keywords: split-half reliability replicability

### ** Examples

data(RSPdata)
data(beh.comp)
	# Is the pattern of relationships between self reported extraversion and behavior replicable
RSPdata$sEXT
head(beh.comp)
vector.splithalf(RSPdata$sEXT, beh.comp) #split-half reliability = .684
	# Might also compare with vector.alpha
vector.alpha(RSPdata$sEXT, beh.comp)	#alpha = .665




