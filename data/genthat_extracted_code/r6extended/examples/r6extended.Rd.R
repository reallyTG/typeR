library(r6extended)


### Name: r6extended
### Title: extended R6 class
### Aliases: r6extended
### Keywords: data

### ** Examples


# make new
ext <- r6extended$new()

# what is there?
ext$ls()

# getting things (wherever they are, also private stuff)
ext$get("options")
ext$get("hashes")

# messages
ext$message("Please note ...")
ext$options$verbose <- FALSE
ext$message("Please note ...")

# warning
ext$warning("Beware! ...")

# build in hashing
ext$hash_do()
ext$hash_get("options")

# debugging
ext$debug()
private$hash()
self$ls()




