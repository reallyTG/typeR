library(queuecomputer)


### Name: wait_step
### Title: Compute maximum time for each row from two vectors of arrival
###   times.
### Aliases: wait_step

### ** Examples

set.seed(500)
arrivals <- rlnorm(100, meanlog = 4)
service <- rlnorm(100)

#Airport example ------------------------

# Create a number of bags for each of 100 customers
bags <- rpois(100,1)

# Create a bags dataframe, with each bag associated with one customer.
bags.df <- data.frame(BagID = 1:sum(bags),
   ID = rep(1:100, bags), times = rlnorm(sum(bags), meanlog = 2))

# Create a function which will return the maximum time from each customer's set of bags.

reduce_bags <- function(bagdataset, number_of_passengers){
   ID = NULL
   times = NULL

   zerobags <- data.frame(BagID = NA, ID = c(1:number_of_passengers), times = 0)
   reduced_df <- as.data.frame(dplyr::summarise(dplyr::group_by(
   rbind(bagdataset, zerobags), ID), n = max(times, 0)))
   ord <- order(reduced_df$ID)
   reduced_df <- reduced_df[order(ord),]
   names(reduced_df) <- c("ID", "times")
   return(reduced_df)
}


arrivals2 <- reduce_bags(bags.df, 100)$times

# Find the time when customers can leave with their bags.
wait_step(arrivals = arrivals, service = arrivals2)



