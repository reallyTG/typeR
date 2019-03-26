library(repo)


### Name: repo_pies
### Title: Plots a pie chart of repository contents
### Aliases: repo_pies

### ** Examples

## Repository creation
rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)

## Producing some irrelevant data of different sizes
data1 <- 1:10
data2 <- 1:length(data(1))*2
data3 <- 1:length(data(1))*3

## Putting the data in the database, specifying dependencies
rp$put(data1, "item1", "First item", "repo_pies")
rp$put(data2, "item2", "Second item", "repo_pies")
rp$put(data3, "item3", "Third item", "repo_pies")

## Showing the pie chart
rp$pies()

## wiping temporary repo
unlink(rp_path, TRUE)



