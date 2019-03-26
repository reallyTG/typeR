# Coverage tool covr::codecov() alters the behaviour of inShell() function. This function
# recovers from that for testing purposes.
sanitizeCovr <- function(r) {
  i <- grep('covr:::count(', r, fixed=TRUE)
  res <- r
  if (length(i) > 0) {
    res[i+1] <- gsub('  ', ' ', res[i+1], fixed=TRUE)
    res <- res[-1 * c(i-1, i, i+2)]
  }
  res
}

