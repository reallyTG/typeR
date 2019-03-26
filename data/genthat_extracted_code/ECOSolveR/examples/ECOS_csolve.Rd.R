library(ECOSolveR)


### Name: ECOS_csolve
### Title: Solve a conic optimization problem
### Aliases: ECOS_csolve

### ** Examples


## githubIssue98
G <- local({
     Gpr <- c(0.416757847405471, 2.136196095668454, 1.793435585194863, -1.,
         0.056266827226329, -1.640270808404989, 0.841747365656204, -1.,
         0.416757847405471, 2.136196095668454, 1.793435585194863, -1.,
         0.056266827226329, -1.640270808404989, 0.841747365656204, -1., -1.)
     Gjc <- as.integer(c(0, 4, 8, 12, 16, 17))
     Gir <- as.integer(c(0, 1, 2, 7, 0, 1, 2, 8, 3, 4, 5, 9, 3, 4, 5, 10, 6))
     Matrix::sparseMatrix(i = Gir, p = Gjc, x = Gpr, index1 = FALSE)
})
print(G)
c <- as.numeric(c(0, 0, 0, 0, 1))
h <- as.numeric(c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))
dims <- list(l = 6L, q = 5L, e = 0L)
ECOS_csolve(c = c, G = G, h = h,
           dims = dims,
           A = NULL, b = numeric(0))


## A larger problem using saved data for the large matrices
MPC01 <- readRDS(system.file("misc", "MPC01.rds", package="ECOSolveR"))
retval <- ECOS_csolve(c = MPC01$c, G = MPC01$G, h = MPC01$h,
                      dims = MPC01$dims)
retval$retcodes
retval$infostring
retval$summary




