library(solvebio)

assert_api_key <- function() {
    token <- solvebio:::.solveEnv$token
    if (is.null(token) || nchar(token) == 0) {
        skip("API key not set")
    }
}
