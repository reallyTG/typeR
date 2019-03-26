library(hashmap)


### Name: load_hashmap
### Title: Load Hashmaps
### Aliases: load_hashmap

### ** Examples

H <- hashmap(sample(letters[1:10]), sample(1:10))
tf <- tempfile()

save_hashmap(H, tf)

H2 <- load_hashmap(tf)
all.equal(
    sort(H$find(H2$keys())),
    sort(H2$values())
)

all.equal(
    H$data.frame(),
    readRDS(tf)
)



