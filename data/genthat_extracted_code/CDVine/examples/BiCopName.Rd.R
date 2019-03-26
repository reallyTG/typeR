library(CDVine)


### Name: BiCopName
### Title: Bivariate copula family names
### Aliases: BiCopName

### ** Examples

# family as number
family = 1
BiCopName(family,short=TRUE)	 # short version
BiCopName(family,short=FALSE)	# long version

# family as character expression (short version)
family = "C"
BiCopName(family)	# as number

# long version
family = "Clayton"
BiCopName(family)	# as number



