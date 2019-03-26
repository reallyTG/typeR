context("Default run")

# library("mvtnorm")

### TEST CCDR ---------------------------------------------

### Generate data
data <- suppressMessages(sparsebnUtils::sparsebnData(generate_fixed_data_frame(), type = "c"))
# data <- suppressWarnings(sparsebnUtils::sparsebnData(X, type = "continuous"))

test_that("Testing default behaviour of ccdr.run", {
    final <- ccdr.run(data = data, lambdas.length = 20)

    expect_is(final, "list")

    ### Check output types
    check_sbf <- check_list_class(final, "sparsebnFit")
    expect_true(check_sbf)
    # for(i in seq_along(final)){
    #     expect_is(final[[i]], "sparsebnFit")
    # }

    ### Check consistency of nedge
    for(i in seq_along(final)){
        matrix.nedge <- Matrix::nnzero(get.adjacency.matrix(final[[i]]$edges))
        edgeL.nedge <- num.edges(final[[i]]$edges)
        expect_equal(final[[i]]$nedge, edgeL.nedge, matrix.nedge)
    }
})

test_that("Testing ccdr.run with manual settings", {
    lambdas <- sparsebnUtils::generate.lambdas(lambda.max = sqrt(nrow(data$data)), lambdas.ratio = 0.1, lambdas.length = 20, scale = "linear")
    final <- ccdr.run(data = data, lambdas = lambdas, alpha = 3, max.iters = 10, verbose = FALSE)

    expect_is(final, "list")

    ### Check output types
    check_sbf <- check_list_class(final, "sparsebnFit")
    expect_true(check_sbf)
    # for(i in seq_along(final)){
    #     expect_is(final[[i]], "sparsebnFit")
    # }

    ### Check consistency of nedge
    for(i in seq_along(final)){
        matrix.nedge <- Matrix::nnzero(get.adjacency.matrix(final[[i]]$edges))
        edgeL.nedge <- num.edges(final[[i]]$edges)
        expect_equal(final[[i]]$nedge, edgeL.nedge, matrix.nedge)
    }
})

test_that("Bugfix: ccdr.run returns the correct number of solutions", {
    ### Edge threshold not met, return all solutions
    final <- ccdr.run(data = data, lambdas.length = 5)
    expect_equal(length(final), 5)

    ### Edge threshold met, only return subpath of complete solutions
    final <- ccdr.run(data = data, lambdas.length = 5, alpha = 0.1)
    expect_equal(length(final), 1)
})

test_that("ccdr.run with intervention, case 1:", {
    ### Simply add some intervention to data
    data.ivn <- data
    data.ivn$ivn <- as.list(rep(1L, nrow(data$data)))

    final <- ccdr.run(data = data.ivn, lambdas.length = 10) ## use most of the default settings
    expect_is(final, "list")

    ### Check output types
    check_sbf <- check_list_class(final, "sparsebnFit")
    expect_true(check_sbf)
    # for(i in seq_along(final)){
    #     expect_is(final[[i]], "sparsebnFit")
    # }

    ### Check consistency of nedge
    for(i in seq_along(final)){
        matrix.nedge <- Matrix::nnzero(get.adjacency.matrix(final[[i]]$edges))
        edgeL.nedge <- num.edges(final[[i]]$edges)
        expect_equal(final[[i]]$nedge, edgeL.nedge, matrix.nedge)
    }
})

test_that("Testing ccdr.run with intervention using manual settings", {
    lambdas <- sparsebnUtils::generate.lambdas(lambda.max = sqrt(nrow(data$data)), lambdas.ratio = 0.1, lambdas.length = 20, scale = "linear")
    final <- ccdr.run(data = data, lambdas = lambdas, alpha = 3, max.iters = 10, verbose = FALSE)

    expect_is(final, "list")

    ### Check output types
    check_sbf <- check_list_class(final, "sparsebnFit")
    expect_true(check_sbf)
    # for(i in seq_along(final)){
    #     expect_is(final[[i]], "sparsebnFit")
    # }

    ### Check consistency of nedge
    for(i in seq_along(final)){
        matrix.nedge <- Matrix::nnzero(get.adjacency.matrix(final[[i]]$edges))
        edgeL.nedge <- num.edges(final[[i]]$edges)
        expect_equal(final[[i]]$nedge, edgeL.nedge, matrix.nedge)
    }
})

test_that("Bugfix: ccdr.run returns the correct number of solutions", {
    ### Edge threshold not met, return all solutions
    final <- ccdr.run(data = data, lambdas.length = 5)
    expect_equal(length(final), 5)

    ### Edge threshold met, only return subpath of complete solutions
    final <- ccdr.run(data = data, lambdas.length = 5, alpha = 0.1)
    expect_equal(length(final), 1)
})
