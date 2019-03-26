# Types

## CustomExtractMatrix (stores characters as a string in an attribute called _data)

registerS3method("length", "CustomExtractMatrix", function(x) {
    prod(attr(x, "_dim"))
})

registerS3method("dim", "CustomExtractMatrix", function(x) {
    attr(x, "_dim")
})

registerS3method("dimnames", "CustomExtractMatrix", function(x) {
    attr(x, "_dimnames")
})

registerS3method("[", "CustomExtractMatrix", extract(
    extract_vector = function(x, i, ...) {
        Z <- vector(mode = typeof(attr(x, "_data")), length = length(i))
        # Handle x[FALSE]
        if (length(i) > 0L) {
            for (idx in 1L:length(i)) {
                if (is.na(i[idx])) {
                    # Handle NAs
                    value <- NA_character_
                } else if (i[idx] > nchar(attr(x, "_data"))) {
                    # Handle out of bounds
                    value <- NA_character_
                } else {
                    value <- substr(attr(x, "_data"), i[idx], i[idx])
                }
                Z[idx] <- value
            }
        }
        return(Z)
    },
    extract_matrix = function(x, i, j, ...) {
        Z <- matrix(
            data = vector(mode = typeof(attr(x, "_data")), length = length(i) * length(j)),
            nrow = length(i),
            ncol = length(j),
            dimnames = list(attr(x, "_dimnames")[[1L]][i], attr(x, "_dimnames")[[2L]][j])
        )
        # Handle x[FALSE, ] or x[, FALSE]
        if (length(i) > 0L && length(j) > 0L) {
            for (colIdx in 1L:length(j)) {
                for (rowIdx in 1L:length(i)) {
                    k <- ijtok(x, i[rowIdx], j[colIdx])
                    Z[rowIdx, colIdx] <- substr(attr(x, "_data"), k, k)
                }
            }
        }
        return(Z)
    }
))


## CustomReplaceMatrix (builds on top of CustomExtractMatrix and allows to change data stored in the _data attribute)

registerS3method("[<-", "CustomReplaceMatrix", replace(
    replace_vector = function(x, i, ..., value) {
        value <- as.character(value)
        # Handle x[FALSE]
        if (length(i) > 0L) {
            for (idx in 1L:length(i)) {
                substr(attr(x, "_data"), i[idx], i[idx])  <- value[idx]
            }
        }
        return(x)
    }, replace_matrix = function(x, i, j, ..., value) {
        value <- as.character(value)
        dim(value) <- c(length(i), length(j))
        # Handle x[FALSE, ] or x[, FALSE]
        if (length(i) > 0L && length(j) > 0L) {
            for (colIdx in 1L:length(j)) {
                for (rowIdx in 1L:length(i)) {
                    k <- ijtok(x, i[rowIdx], j[colIdx])
                    substr(attr(x, "_data"), k, k) <- value[rowIdx, colIdx]
                }
            }
        }
        return(x)
    }
))


# Tests

seed <- 4711L
n <- 5L
p <- 5L
dimnames <- list(paste0("row_", 1L:n), paste0("col_", 1L:p))
VALUE_POOL <- c(0:9, letters)
OUT_OF_BOUNDS_INT <- 100
OUT_OF_BOUNDS_CHAR <- "x"

createCustomExtractMatrix <- function() {
    obj <- list()
    class(obj) <- "CustomExtractMatrix"
    attr(obj, "_dim") <- c(n, p)
    attr(obj, "_dimnames") <- dimnames
    set.seed(seed)
    attr(obj, "_data") <- paste(sample(VALUE_POOL, replace = TRUE, size = n * p), collapse = "")
    return(obj)
}

createCustomReplaceMatrix <- function() {
    obj <- list()
    class(obj) <- c("CustomReplaceMatrix", "CustomExtractMatrix")
    attr(obj, "_dim") <- c(n, p)
    attr(obj, "_dimnames") <- dimnames
    set.seed(seed)
    attr(obj, "_data") <- paste(sample(VALUE_POOL, replace = TRUE, size = n * p), collapse = "")
    return(obj)
}

createMatrix <- function() {
    set.seed(seed)
    matrix(data = sample(VALUE_POOL, replace = TRUE, size = n * p), nrow = n, ncol = p, dimnames = dimnames)
}

# extract
CROCHET_EXTRACT_ENV <- new.env()
CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT <- OUT_OF_BOUNDS_INT
CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR <- OUT_OF_BOUNDS_CHAR
CROCHET_EXTRACT_ENV$COMPARE_OBJECT <- createMatrix()
CROCHET_EXTRACT_ENV$CUSTOM_OBJECT <- createCustomExtractMatrix()


# replace
CROCHET_REPLACE_ENV <- new.env()
CROCHET_REPLACE_ENV$OUT_OF_BOUNDS_INT <- OUT_OF_BOUNDS_INT
CROCHET_REPLACE_ENV$OUT_OF_BOUNDS_CHAR <- OUT_OF_BOUNDS_CHAR
CROCHET_REPLACE_ENV$VALUE_POOL <- VALUE_POOL
CROCHET_REPLACE_ENV$RESET <- function() {
    CROCHET_REPLACE_ENV$COMPARE_OBJECT <- createMatrix()
    CROCHET_REPLACE_ENV$CUSTOM_OBJECT <- createCustomReplaceMatrix()
}
CROCHET_REPLACE_ENV$RESET()
