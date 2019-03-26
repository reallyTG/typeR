library(repo)


### Name: repo_put
### Title: Create a new item in the repository.
### Aliases: repo_put

### ** Examples

## Repository creation
rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)

## Producing some irrelevant data
data1 <- 1:10
data2 <- data1 * 2
data3 <- data1 / 2

## Putting the data in the database, specifying dependencies
rp$put(
    obj = data1,
    name = "item1",
    description = "First item",
    tags = c("repo_put", "a_random_tag"),
    )
rp$put(data2, "item2", "Item dependent on item1",
    "repo_dependencies", depends="item1")
rp$put(data3, "item3", "Item dependent on item1 and item2",
    "repo_dependencies", depends=c("item1", "item2"))

print(rp)

## Creating another version of item1
data1.2 <- data1 + runif(10)
rp$put(data1.2, name = "item1", "First item with additional noise",
    tags = c("repo_put", "a_random_tag"), replace="addversion")
print(rp, all=TRUE)
rp$info("item1#1")

## wiping temporary repo
unlink(rp_path, TRUE)



