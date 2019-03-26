library(asnipe)


### Name: get_group_by_individual
### Title: Convert group or individual data into a group by individual
###   matrix
### Aliases: get_group_by_individual

### ** Examples

## define group memberships (these would be read from a file)
individuals <- data.frame(ID=c("C695905","H300253","H300253",
	"H300283","H839876","F464557","H300296","H300253",
	"F464557","H300296","C695905","H300283","H839876"),
	GROUP=c(1,1,2,2,2,3,3,4,5,5,6,6,6))

## create a time column
individuals <- cbind(individuals,
	DAY=c(1,1,1,1,1,2,2,2,3,3,3,3,3))

gbi <- get_group_by_individual(individuals, 
	data_format="individuals")
	
## define group memberships (these would be read from a file)
groups <- list(G1=c("C695905","H300253"),
	G2=c("H300253","H300283","H839876"),
	G3=c("F464557","H300296"),
	G4=c("H300253"),
	G5=c("F464557","H300296"),
	G6=c("C695905","H300283","H839876"))

## create a time variable
days <- c(1,1,2,2,3,3)

gbi <- get_group_by_individual(groups, 
	data_format="groups")




