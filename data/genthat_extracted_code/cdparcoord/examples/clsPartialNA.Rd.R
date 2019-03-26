library(cdparcoord)


### Name: clsTupleFreqs
### Title: Compute/display tuple frequency counts, and optionally account
###   for NA values
### Aliases: tupleFreqs clsTupleFreqs discparcoord

### ** Examples


   ## Not run: 
##D        data(Titanic_Passengers)
##D        # Find frequencies in parallel
##D        discparcoord(Titanic_Passengers, inParallel=TRUE)
##D     
## End(Not run)

    data(hrdata)
    input1 = list("name" = "average_montly_hours",
                  "partitions" = 3, "labels" = c("low", "med", "high"))
    input = list(input1)
    # this will discretize the data by partitioning average monthly 
    # hours into 3 parts called low, med, and high
    hrdata = discretize(hrdata, input)
    print('first few discretized tuples')
    # first line should be 0.38,0.53,2,low,3,0,1,00,sales,low
    head(hrdata)
    print('first few most-frequent tuples')
    # first line should be 0.40,0.46,2,...,11
    tupleFreqs(hrdata)
    ## Not run: 
##D        # account for NA values and plot with parallel coordinates
##D        discparcoord(hrdata)
##D        # same as above, but with scrambled columns
##D        discparcoord(hrdata, permute=TRUE)
##D        # same as above, but show top k values
##D        discparcoord(hrdata, k=8)
##D        # same as above, but group according to profession
##D        discparcoord(hrdata, grpcategory="sales")
##D     
## End(Not run)



