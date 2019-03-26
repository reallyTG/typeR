library("slam")

m <- matrix(c(2, 5, 0, 8, 0,
              0, 0, 0, 0, 0,
              0, 0, 3, 2, 1),
            nr = 3, nc = 5, byrow = TRUE,
            dimnames = list(c("X", "Y", "Z"),
                            LETTERS[1 : 5]))
x <- as.simple_triplet_matrix(m)

identical(
    lapply(split(x, c(1, 2, 2)), as.matrix),
	   split.data.frame(m, c(1, 2, 2))
)
identical(
    lapply(split(x, c(1, NA, 2)), as.matrix),
	   split.data.frame(m, c(1, NA, 2))
)

local({
    colnames(x) <- NULL
    x[] <- 0
    identical(
	lapply(split(x, c(1, 1, 2, 2, 3), MARGIN = 2), as.matrix),
	lapply(split.data.frame(as.matrix(t(x)), c(1, 1, 2, 2, 3)), t)
    )
})

