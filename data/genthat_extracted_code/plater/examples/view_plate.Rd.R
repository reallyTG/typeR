library(plater)


### Name: view_plate
### Title: Displays the data in the form of a microtiter plate.
### Aliases: view_plate

### ** Examples

# Generate some tidy data
data <- data.frame(Wells = paste0(LETTERS[1:3], 0, rep(1:4, each = 3)), 
Species = rep(c("Alien", "Human", "Cat"), 4), 
OxygenProduction = round(rnorm(12), 3))
head(data)

# See which wells had cells from which species and the amount of oxygen 
# produced for each well
view_plate(data, "Wells", c("Species", "OxygenProduction"), 12)



