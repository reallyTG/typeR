## Test reading data sets in different file formats, based on the example DSM_TermContext matrix

library(wordspace)

## example data: DSM_TermContext
TC <- DSM_TermContext        # order rows and columns alphabetically for comparison with input files
idxR <- order(TC$rows$term)
idxC <- order(TC$cols$term)
TC$M <- TC$M[idxR, idxC]
TC$rows <- TC$rows[idxR, ]
TC$cols <- TC$cols[idxC, ]
invisible(check.dsm(TC, validate=TRUE))
head(TC, Inf)

## compare relevant information in two DSM objects, ignoring other details
check.ae <- function (res, name, what) {
  if (!isTRUE(res)) {
    cat(sprintf("--- %s: %s ---\n", name, what))
    cat(paste0("\t", res, "\n"))
    stop("test failed")
  }
}

compare.dsm <- function (A, B, check.marginals=TRUE, name="Error") {
  invisible(check.dsm(A, validate=TRUE))
  invisible(check.dsm(B, validate=TRUE))
  check.ae(all.equal(A$M, B$M), name, "mismatch in co-occurrence matrix")
  check.ae(all.equal(A$rows$term, B$rows$term), name, "mismatch in target terms (rows)")
  check.ae(all.equal(A$cols$term, B$cols$term), name, "mismatch in feature terms (columns)")
  check.ae(all.equal(A$rows$nnzero, B$rows$nnzero), name, "mismatch in nonzero counts for rows")
  check.ae(all.equal(A$cols$nnzero, B$cols$nnzero), name, "mismatch in nonzero counts for columns")
  if (check.marginals) {
    check.ae(all.equal(A$rows$f, B$rows$f), name, "mismatch in row marginal frequencies")
    check.ae(all.equal(A$cols$f, B$cols$f), name, "mismatch in column marginal frequencies")
    check.ae(all.equal(A$globals$N, B$globals$N), name, "mismatch in sample size")
  }
}

## Co-occurrence matrix in triplet representation
triplet.file <- system.file("extdata", "term_context_triplets.gz", package="wordspace", mustWork=TRUE)
TC.triplet <- read.dsm.triplet(triplet.file, freq=TRUE, sort=TRUE, encoding="ascii")
compare.dsm(TC, TC.triplet, name="DSM loaded from triplet file", check.marginals=FALSE) # correct marginal frequencies cannot be obtained from triplet file

## Triplet file with explicit marginal frequencies
marginal.file <- system.file("extdata", "term_context_marginals.txt.gz", package="wordspace", mustWork=TRUE)
TC.triplet <- read.dsm.triplet(triplet.file, rowinfo=marginal.file, colinfo=marginal.file, N=TC$globals$N, freq=TRUE, sort=TRUE, encoding="ascii")
compare.dsm(TC, TC.triplet, name="DSM loaded from triplet file with explicit marginals")

with(TC.triplet$rows, if (!all(df == nnzero)) stop("failed to import additional row information for triplet file"))
with(TC.triplet$cols, if (!all(df == nnzero)) stop("failed to import additional column information for triplet file"))

## span size adjustment
TC.spansize <- read.dsm.triplet(triplet.file, rowinfo=marginal.file, colinfo=marginal.file, N=TC$globals$N, freq=TRUE, span.size=42, sort=TRUE, encoding="ascii")
check.ae(all.equal(TC$rows$f * 42, TC.spansize$rows$f), "span size adjustment", "row marginals incorrect")
check.ae(all.equal(TC$cols$f, TC.spansize$cols$f), "span size adjustment", "column marginals incorrect")

## UCS export format
ucs.file <- system.file("extdata", "term_context_ucs", package="wordspace", mustWork=TRUE)
TC.ucs <- read.dsm.ucs(ucs.file, encoding="ascii")
compare.dsm(TC, TC.ucs, name="DSM loaded from UCS export format")


## Check that non-ASCII characters in different encodings are read correctly
Encode.ref <- c("Test", "\u{0164}\u{00E9}\u{015F}t") # expected rownames of DSM

test.encoding <- function (filename, encoding, ref=Encode.ref, force=FALSE) {
  if (!force && !(encoding %in% iconvlist())) {
    warning(sprintf("the %s character encoding is not supported on this platform", encoding))
  } else {
    model <- read.dsm.triplet(system.file("extdata", filename, package="wordspace", mustWork=TRUE), encoding=encoding, tokens=TRUE, sort=FALSE)
    if (!all(ref == model$rows$term)) stop(sprintf("failed to load %s triplet file", encoding))
  }
}

test.encoding("tokens_utf8.txt", "UTF-8", force=TRUE) # should work on all platforms
test.encoding("tokens_latin2.txt", "ISO-8859-2")
test.encoding("tokens_utf16.txt", "UTF-16")
