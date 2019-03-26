library(asnipe)


### Name: get_sampling_periods
### Title: Convert group or individual data into sampling periods
### Aliases: get_sampling_periods

### ** Examples

## define group memberships (these would be read from a file)
individuals <- data.frame(ID=c("C695905","H300253","H300253",
	"H300283","H839876","F464557","H300296","H300253",
	"F464557","H300296","C695905","H300283","H839876"),
	GROUP=c(1,1,2,2,2,3,3,4,5,5,6,6,6))

## create a time column
individuals <- cbind(individuals,
	DAY=c(1,1,1,1,1,2,2,2,3,3,3,3,3))

SPs <- get_sampling_periods(individuals[,c(1,2)],
	individuals[,3],1,data_format="individuals")
occurs <- get_sampling_periods(individuals[,c(1,2)],
	individuals[,3],1,data_format="individuals", return="occ")
	
## define group memberships (these would be read from a file)
groups <- list(G1=c("C695905","H300253"),
	G2=c("H300253","H300283","H839876"),
	G3=c("F464557","H300296"),
	G4=c("H300253"),
	G5=c("F464557","H300296"),
	G6=c("C695905","H300283","H839876"))

## create a time variable
days <- c(1,1,2,2,3,3)

SPs <- get_sampling_periods(groups,
	days,1,data_format="groups")
occurs <- get_sampling_periods(groups,
	days,1,data_format="groups", return="occ")




