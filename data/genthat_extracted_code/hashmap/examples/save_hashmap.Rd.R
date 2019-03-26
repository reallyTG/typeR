library(hashmap)


### Name: save_hashmap
### Title: Save Hashmaps
### Aliases: save_hashmap

### ** Examples

H <- hashmap(sample(letters[1:10]), sample(1:10))
tf <- tempfile()

save_hashmap(H, tf)

inherits(
    try(save_hashmap(H, tf, FALSE), silent = TRUE),
    "try-error"
)

H$insert("zzzzz", 123L)
save_hashmap(H, tf)

load_hashmap(tf)



