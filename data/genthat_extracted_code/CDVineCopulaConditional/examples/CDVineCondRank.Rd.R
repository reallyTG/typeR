library(CDVineCopulaConditional)


### Name: CDVineCondRank
### Title: Ranking of C- and D- vines allowing for conditional simulation
### Aliases: CDVineCondRank

### ** Examples


# Read data
data(dataset)
data <- dataset$data[1:100,1:5]

# Define the variables Y and X. X are the conditioning variables, 
# which have to be positioned in the last columns of the data.frame
colnames(data) <- c("Y1","Y2","X3","X4","X5")

# Rank the possible D-Vines according to the AIC
## Not run: 
##D Ranking <- CDVineCondRank(data,Nx=3,"AIC",type="DVine")
##D Ranking$table
##D #    tree       AIC type
##D # 1     1 -292.8720    2
##D # 2     2 -290.2941    2
##D # 3     3 -288.5719    2
##D # 4     4 -288.2496    2
##D # 5     5 -287.8006    2
##D # 6     6 -285.8503    2
##D # 7     7 -282.2867    2
##D # 8     8 -278.9371    2
##D # 9     9 -275.8339    2
##D # 10   10 -272.9459    2
##D # 11   11 -271.1526    2
##D # 12   12 -270.5269    2
##D 
##D Ranking$vines[[1]]$AIC
##D # [1] -292.8720
##D summary(Ranking$vines[[1]])
## End(Not run)




