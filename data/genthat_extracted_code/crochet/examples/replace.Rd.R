library(crochet)


### Name: replace
### Title: Create an Implementation of [<- For Custom Matrix-Like Types
### Aliases: replace

### ** Examples

b <- matrix(data = rnorm(25), nrow = 5, ncol = 5)
dimnames(b) <- list(letters[1:5], letters[1:5])

a <- structure(list(), class = "TestMatrix")

dim.TestMatrix <- function(x) {
    dim(b)
}

dimnames.TestMatrix <- function(x) {
    dimnames(b)
}

extract_vector <- function(x, i) {
    # Dispatch to b instead to x for this demo
    b[i, drop = FALSE]
}

extract_matrix <- function(x, i, j) {
    # Dispatch to b instead to x for this demo
    b[i, j, drop = FALSE]
}

`[.TestMatrix` <- extract(extract_vector = extract_vector, extract_matrix = extract_matrix)

replace_vector <- function(x, i, value) {
    .GlobalEnv$i <- i
    .GlobalEnv$value <- value
    # Dispatch to b instead to x for this demo
    with(.GlobalEnv, b[i] <- value)
    # Don't forget to return x
    return(x)
}

replace_matrix <- function(x, i, j, value) {
    .GlobalEnv$i <- i
    .GlobalEnv$j <- j
    .GlobalEnv$value <- value
    # Dispatch to b instead to x for this demo
    with(.GlobalEnv, b[i, j] <- value)
    # Don't forget to return x
    return(x)
}

`[<-.TestMatrix` <- replace(replace_vector = replace_vector, replace_matrix = replace_matrix)



