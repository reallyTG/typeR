library(VennDiagram)


### Name: calculate.overlap
### Title: Calculate Overlap
### Aliases: calculate.overlap
### Keywords: hplot

### ** Examples

# A simple single-set diagram
cardiome <- letters[1:10]
superset <- letters[8:24]
overlap <- calculate.overlap(
	x = list(
		"Cardiome" = cardiome,
		"SuperSet" = superset
		)
	);



