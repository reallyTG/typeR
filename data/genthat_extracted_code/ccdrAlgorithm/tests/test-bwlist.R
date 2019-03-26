context("black/white lists")

dat <- generate_fixed_data_frame()
sbdata <- suppressMessages(sparsebnData(dat, type = "c"))

### Get all blocks at once
nodes <- names(sbdata$data)
blocks <- lapply(nodes, function(x){
    # Allow all off-diagonal entries since we are no longer using the block decomposition
    row <- (nodes)[nodes != x]
    col <- rep(x, length(col))
    cbind(row, col)
})
blocks <- do.call("rbind", blocks)

pp <- ncol(dat)
node_names <- names(dat)
len_saturate <- pp*(pp-1)/2
nlambda <- 20

test_that("White lists work OK", {
    dags <- ccdr.run(sbdata, lambdas.length = nlambda, whitelist = blocks)
    expect_equal(num.edges(dags), rep(len_saturate, nlambda))

    # One edge
    from <- "a0"
    to <- "b0"
    from.idx <- match(from, node_names)
    to.idx <- match(to, node_names)
    white <- rbind(c(from, to))
    dags <- ccdr.run(sbdata, lambdas.length = nlambda, whitelist = white)
    check_edge <- all(unlist(lapply(dags, function(x) from.idx %in% as.list(x$edges)[[to]])))
    expect_true(check_edge)

    # Two edges
    from <- "e0"
    to <- "c0"
    from.idx <- match(from, node_names)
    to.idx <- match(to, node_names)
    white <- rbind(c("a0", "b0"), c(from, to))
    dags <- ccdr.run(sbdata, lambdas.length = nlambda, whitelist = white)
    check_edge <- all(unlist(lapply(dags, function(x) from.idx %in% as.list(x$edges)[[to]])))
    expect_true(check_edge)
})

test_that("Black lists work OK", {
    dags <- ccdr.run(sbdata, lambdas.length = nlambda, blacklist = blocks)
    expect_equal(num.edges(dags), rep(0, nlambda))

    # One edge
    from <- "a0"
    to <- "b0"
    from.idx <- match(from, node_names)
    to.idx <- match(to, node_names)
    black <- rbind(c(from, to))
    dags <- ccdr.run(sbdata, lambdas.length = nlambda, blacklist = black)
    check_edge <- any(unlist(lapply(dags, function(x) from.idx %in% as.list(x$edges)[[to]])))
    expect_false(check_edge)

    # Two edges
    from <- "e0"
    to <- "c0"
    from.idx <- match(from, node_names)
    to.idx <- match(to, node_names)
    black <- rbind(c("a0", "b0"), c(from, to))
    dags <- ccdr.run(sbdata, lambdas.length = nlambda, blacklist = black)
    check_edge <- any(unlist(lapply(dags, function(x) from.idx %in% as.list(x$edges)[[to]])))
    expect_false(check_edge)
})
