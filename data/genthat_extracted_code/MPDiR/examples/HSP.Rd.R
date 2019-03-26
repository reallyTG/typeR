library(MPDiR)


### Name: HSP
### Title: Hecht, Schlaer and Pirenne (1942) psychometric functions
### Aliases: HSP
### Keywords: datasets

### ** Examples

data(HSP)
lattice::xyplot(p/100 ~ Q | Obs * Run, HSP,  
	type = c("p", "l"), 
	scales = list(x = list(log = TRUE)), 
	as.table = TRUE)



