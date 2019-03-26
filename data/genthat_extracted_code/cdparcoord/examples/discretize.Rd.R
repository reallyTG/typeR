library(cdparcoord)


### Name: discretize
### Title: Discretize continuous data.
### Aliases: discretize

### ** Examples


    data(prgeng)
    pe <- prgeng[,c(1,3,5,7:9)]  # extract vars of interest
    pe25 <- pe[pe$wageinc < 250000,]  # delete extreme values
    pe25disc <- discretize(pe25)  # age, wageinc and wkswrkd discretized

    data(mlb)
    # extract the height, weight, age, and position of players
    m <- mlb[,4:7]

    inp1 <- list("name" = "Height",
                 "partitions"=4,
                 "labels"=c("short", "shortmid", "tallmid", "tall"))

    inp2 <- list("name" = "Weight",
                 "partitions"=3,
                 "labels"=c("light", "med", "heavy"))

    inp3 <- list("name" = "Age",
                 "partitions"=3,
                 "labels"=c("young", "med", "old"))

    # create one list to pass everything to discretize()
    discreteinput <- list(inp1, inp2, inp3)
    head(discreteinput)

    # at this point, all of the data has been discretized
    discretizedmlb <- discretize(m, discreteinput)
    head(discretizedmlb)





