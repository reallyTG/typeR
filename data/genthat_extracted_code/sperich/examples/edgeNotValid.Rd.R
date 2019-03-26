library(sperich)


### Name: edgeNotValid
### Title: Edge-Water-Test
### Aliases: edgeNotValid

### ** Examples

##load data
data(dataset.all.species)
data(dataset.landwater)

##initialize variables
distance <- 5

##create grid parameters
dimension <- getDimension(dataset.all.species)
shift <- getShift(dataset.all.species)

##create landwatermask
landwatermask.nocoast <- createLandwatermask(dataset.landwater, dimension, shift)

##extract datasets of one species out of database
dataset.one.species <- extract.species(dataset.all.species, 3)

##create grid
grid <- matrix(0,dimension[1],dimension[2])

##add points
grid <- data.into.Grid(dataset.one.species, dimension, shift)

##points to list
points <- which(grid > 0)
points.xy <- list()
for (i in 1:length(points)){
	points.xy[[i]] <- c(ifelse((points[i] %% dimension[1]) == 0, dimension[1], 
			points[i] %% dimension[1]), ceiling(points[i]/dimension[1]))
}

##Edge-Water-Test
check <- edgeNotValid(grid, points.xy[[1]],points.xy[[2]], 
			landwatermask.nocoast, 1000)
print(check)



