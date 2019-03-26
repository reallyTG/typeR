n <- 4L
p <- 4L
dimnames <- list(
    paste0("row_", seq_len(n)),
    paste0("col_", seq_len(p))
)

dummy <- createMatrix(n, p, dimnames)

for (class in c("ColumnLinkedMatrix", "RowLinkedMatrix")) {

    context(class)

    linkedBy <- ifelse(class == "ColumnLinkedMatrix", "columns", "rows")

    test_that("LinkedMatrix creation", {

        for (nNodes in c(1, 2)) {

            linkedMatrix <- LinkedMatrix(nrow = n, ncol = p, nNodes = nNodes, linkedBy = linkedBy, nodeInitializer = "matrixNodeInitializer")
            expect_equal(nNodes(linkedMatrix), nNodes)
            expect_is(linkedMatrix[[1]], "matrix")

            if (requireNamespace("ff", quietly = TRUE)) {
                linkedMatrix <- LinkedMatrix(nrow = n, ncol = p, nNodes = nNodes, linkedBy = linkedBy, nodeInitializer = "ffNodeInitializer", vmode = "integer")
                expect_equal(nNodes(linkedMatrix), nNodes)
                expect_is(linkedMatrix[[1]], "ff_matrix")
            }

        }

    })

    test_that(paste(class, "creation"), {

        expect_error(new(class, c(1, 2, 3)), "*arguments need to be matrix-like*")

        # No input
        linkedMatrix <- new(class)
        expect_equal(nNodes(linkedMatrix), 1)
        expect_true(is.na(linkedMatrix[1, 1]))

        # Single matrix input
        linkedMatrix <- new(class, matrix(data = 0, nrow = 1, ncol = 1))
        expect_equal(nNodes(linkedMatrix), 1)
        expect_equal(dim(linkedMatrix), c(1, 1))

        # Single LinkedMatrix input
        linkedMatrix <- new(class, createLinkedMatrix(n, p, dimnames, class, 2))
        expect_equal(nNodes(linkedMatrix), 1)
        expect_equal(dim(linkedMatrix), dim(dummy))

        # Multiple matrix inputs of same order
        linkedMatrix <- new(class, matrix(data = 0, nrow = 1, ncol = 1), matrix(data = 0, nrow = 1, ncol = 1))
        expect_equal(nNodes(linkedMatrix), 2)
        if (class == "ColumnLinkedMatrix") {
            expect_equal(dim(linkedMatrix), c(1, 2))
        } else {
            expect_equal(dim(linkedMatrix), c(2, 1))
        }

        # Multiple LinkedMatrix inputs of same order
        linkedMatrix <- new(class, createLinkedMatrix(n, p, dimnames, class, 2), createLinkedMatrix(n, p, dimnames, class, 2))
        expect_equal(nNodes(linkedMatrix), 2)
        if (class == "ColumnLinkedMatrix") {
            expect_equal(dim(linkedMatrix), c(n, p * 2))
        } else {
            expect_equal(dim(linkedMatrix), c(p * 2, n))
        }

        # Multiple conformable matrix inputs of different order
        if (class == "ColumnLinkedMatrix") {
            args <- list(matrix(data = 0, nrow = 1, ncol = 3), matrix(data = 0, nrow = 1, ncol = 5))
            dims <- c(1, 8)
        } else {
            args <- list(matrix(data = 0, nrow = 3, ncol = 1), matrix(data = 0, nrow = 5, ncol = 1))
            dims <- c(8, 1)
        }
        linkedMatrix <- do.call(class, args)
        expect_equal(nNodes(linkedMatrix), 2)
        expect_equal(dim(linkedMatrix), dims)

        # Multiple unconformable matrix inputs
        if (class == "ColumnLinkedMatrix") {
            args <- list(matrix(data = 0, nrow = 3, ncol = 1), matrix(data = 0, nrow = 5, ncol = 1))
        } else {
            args <- list(matrix(data = 0, nrow = 1, ncol = 3), matrix(data = 0, nrow = 1, ncol = 5))
        }
        expect_error(do.call(class, args), "*arguments need the same number of*")

        # Warning if dimnames do not match
        dimnamesMismatches <- list(
            list(regexp = NA, dimnames = list(NULL, NULL, NULL)),
            list(regexp = NA, dimnames = list(letters[1:3], letters[1:3], letters[1:3])),
            list(regexp = NULL, dimnames = list(letters[1:3], NULL, NULL)),
            list(regexp = NULL, dimnames = list(letters[1:3], letters[4:6], NULL))
        )
        for (dimnamesMismatch in dimnamesMismatches) {
            if (class == "ColumnLinkedMatrix") {
                args <- list(
                    matrix(data = 0, nrow = 3, ncol = 1, dimnames = list(dimnamesMismatch$dimnames[[1]], NULL)),
                    matrix(data = 0, nrow = 3, ncol = 1, dimnames = list(dimnamesMismatch$dimnames[[2]], NULL)),
                    matrix(data = 0, nrow = 3, ncol = 1, dimnames = list(dimnamesMismatch$dimnames[[3]], NULL))
                )
            } else {
                args <- list(
                    matrix(data = 0, nrow = 1, ncol = 3, dimnames = list(NULL, dimnamesMismatch$dimnames[[1]])),
                    matrix(data = 0, nrow = 1, ncol = 3, dimnames = list(NULL, dimnamesMismatch$dimnames[[2]])),
                    matrix(data = 0, nrow = 1, ncol = 3, dimnames = list(NULL, dimnamesMismatch$dimnames[[3]]))
                )
            }
            expect_warning(do.call(class, args), regexp = dimnamesMismatch$regexp)
        }
    })

    for (nNodes in seq_len(ifelse(class == "ColumnLinkedMatrix", p, n))) {

        context(paste0(class, " with ", nNodes, " nodes"))

        # Prepare LinkedMatrix object
        linkedMatrix <- createLinkedMatrix(n, p, dimnames, class, nNodes)

        test_that("dim", {
            expect_equal(dim(linkedMatrix), dim(dummy))
        })

        test_that("length", {
            expect_equal(length(linkedMatrix), length(dummy))
        })

        test_that("nNodes", {
            expect_equal(nNodes(linkedMatrix), nNodes)
        })

        test_that("bind", {

            if (class == "RowLinkedMatrix") {

                boundLinkedMatrix <- rbind(linkedMatrix, linkedMatrix)
                expect_equal(dim(boundLinkedMatrix), c(n * 2, p))
                expect_equal(nNodes(boundLinkedMatrix), nNodes * 2)

                expect_error(cbind(linkedMatrix, linkedMatrix))

            } else {

                boundLinkedMatrix <- cbind(linkedMatrix, linkedMatrix)
                expect_equal(dim(boundLinkedMatrix), c(n, p * 2))
                expect_equal(nNodes(boundLinkedMatrix), nNodes * 2)

                expect_error(rbind(linkedMatrix, linkedMatrix))

            }

        })

    }

}
