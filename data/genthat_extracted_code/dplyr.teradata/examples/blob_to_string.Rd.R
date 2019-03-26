library(dplyr.teradata)


### Name: blob_to_string
### Title: Convert blob to character.
### Aliases: blob_to_string

### ** Examples

(x <- blob::as.blob("Good morning"))
#> [1] blob[12 B]
x[[1]]
#> [1] 47 6f 6f 64 20 6d 6f 72 6e 69 6e 67
blob_to_string(x)
#> [1] "476f6f64206d6f726e696e67"




