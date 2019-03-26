library(strapgod)


### Name: collect.resampled_df
### Title: Force virtual groups to become explicit rows
### Aliases: collect.resampled_df

### ** Examples

library(dplyr)

# virtual groups become real rows
collect(bootstrapify(iris, 5))

# add on the id column for an identifier per bootstrap
collect(bootstrapify(iris, 5), id = ".id")

# add on the original_id column to know which row this bootstrapped row
# originally came from
collect(bootstrapify(iris, 5), original_id = ".original_id")




