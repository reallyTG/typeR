library(VineCopula)


### Name: BiCopName
### Title: Bivariate Copula Family Names
### Aliases: BiCopName

### ** Examples


## family number to character expression
family <- 1
BiCopName(family, short = TRUE)	 # short version
BiCopName(family, short = FALSE)	 # long version

## family character expression (short version) to number
family <- "C"
BiCopName(family)	# as number

## family character expression (long version) to number
family <- "Clayton"
BiCopName(family)	# as number

## vectors of families
BiCopName(1:10)    # as character expression
BiCopName(c("Clayton","t","J"))    # as number




