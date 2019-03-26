library(repo)


### Name: repo_dependencies
### Title: Build and/or plots a dependency graph
### Aliases: repo_dependencies

### ** Examples

## Repository creation
rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)

## Producing some irrelevant data
data1 <- 1:10
data2 <- data1 * 2
data3 <- data1 + data2

## Putting the data in the database, specifying dependencies
rp$put(data1, "item1", "First item",
    "repo_dependencies")
rp$put(data2, "item2", "Item dependent on item1", 
    "repo_dependencies", depends="item1")
rp$put(data3, "item3", "Item dependent on item1 and item2",
    "repo_dependencies", depends=c("item1", "item2"))

## Creating a temporary plot and attaching it
fpath <- file.path(rp$root(), "temp.pdf")
pdf(fpath)
plot(data1)
dev.off()
rp$attach(fpath, "visualization of item1", "plot",
   to="item1")

## Obtaining the dependency matrix
depmat <- rp$dependencies(plot=FALSE)
print(depmat)
## The matrix can be plotted as a graph (requires igraph package)
rp$dependencies()
## The following hides "generated" edges
rp$dependencies(generated=FALSE)

## wiping temporary repo
unlink(rp_path, TRUE)



