library(surveillance)


### Name: create.disProg
### Title: Creating an object of class disProg
### Aliases: create.disProg print.disProg
### Keywords: datagen

### ** Examples

# create an univariate disProg object 
# read in salmonella.agona data
salmonella <- read.table(system.file("extdata/salmonella.agona.txt", 
                                     package = "surveillance"), header = TRUE)
# look at data.frame
str(salmonella)

salmonellaDisProg <- create.disProg(week = 1:nrow(salmonella), 
                                    observed = salmonella$observed,
                                    state = salmonella$state,
                                    start = c(1990, 1))

# look at disProg object
salmonellaDisProg



