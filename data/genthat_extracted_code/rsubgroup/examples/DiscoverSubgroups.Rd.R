library(rsubgroup)


### Name: DiscoverSubgroups
### Title: Performs Subgroup Discovery
### Aliases: DiscoverSubgroups
### Keywords: subgroup discovery

### ** Examples

# subgroup discovery on a data.frame, for binary target
data(credit.data)
result1 <- DiscoverSubgroups(
    credit.data, as.target("class", "good"), new("SDTaskConfig",
    attributes=c("checking_status", "credit_amount", "employment", "purpose")))
result2 <- DiscoverSubgroups(
    credit.data, as.target("class", "good"), new("SDTaskConfig",
    attributes=c("checking_status", "employment")))

ToDataFrame(result1)
ToDataFrame(result2)

# subgroup discovery for numeric target variable
result3 <- DiscoverSubgroups(
    credit.data, as.target("credit_amount"), new("SDTaskConfig",
    attributes=c("checking_status", "employment")))

ToDataFrame(result3)



