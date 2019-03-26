Sys.setenv(ROI_LOAD_PLUGINS = FALSE)

library(slam)
library(ROI)

## ---------------------------
## Objective
## ---------------------------
test.L_objective <- function() {
    v <- 1:3
    m <- matrix(v, 1)
    slam <- as.simple_triplet_matrix(m)
    nam <- LETTERS[v]
    L_objective(v)
    L_objective(v, nam)
    L_objective(m)
    L_objective(m, nam)
    L_objective(slam)
    L_objective(slam, nam)
}

test.Q_objective <- function() {
    Lv <- 1:3
    Lm <- matrix(Lv, 1)
    Lslam <- as.simple_triplet_matrix(Lm)
    Qm <- diag(length(Lv))
    Qslam <- as.simple_triplet_matrix(Qm)
    nam <- LETTERS[Lv]
    Q_objective(Qm, Lv)
    Q_objective(Qm, Lm)
    Q_objective(Qm, Lslam)
    Q_objective(Qslam, Lv)
    Q_objective(Qslam, Lm)
    Q_objective(Qslam, Lslam)
    Q_objective(Qm, Lv, nam)
    Q_objective(Qm, Lm, nam)
    Q_objective(Qm, Lslam, nam)
    Q_objective(Qslam, Lv, nam)
    Q_objective(Qslam, Lm, nam)
    Q_objective(Qslam, Lslam, nam)
}

test.F_objective <- function() {
    F <- F_objective(sum, 3)
}

## ---------------------------
## Constraints
## ---------------------------
test.NO_constraint <- function() {
    NO_constraint(3)
}

test.L_constraint <- function() {
    L_constraint(matrix(1:3, 1), "==", 2, names=LETTERS[1:3])
}

test.Q_constraint <- function() {
    ## Q_constraint()   
}

test.C_constraint <- function() {
    ## C_constraint
}


## ---------------------------
## Types
## ---------------------------


## ---------------------------
## Bounds
## ---------------------------

## ---------------------------
## R-Methods
## ---------------------------
## rbind

## c
test.combine_L_constraints <- function() {
    dim_1 <- sample(1:10, 2)
    dim_2 <- c(sample(1:10, 1), dim_1[2])

    mat_1 <- matrix(sample(1:100, prod(dim_1)), ncol=dim_1[2])
    dir_1 <- sample(c("==", "<=", ">="), dim_1[1], replace=TRUE)
    rhs_1 <- sample(1:100, dim_1[1])

    mat_2 <- matrix(sample(1:100, prod(dim_2)), ncol=dim_2[2])
    dir_2 <- sample(c("==", "<=", ">="), dim_2[1], replace=TRUE)
    rhs_2 <- sample(1:100, dim_2[1])
    
    lc_1 <- L_constraint(L = mat_1, dir = dir_1, rhs = rhs_1)
    lc_2 <- L_constraint(L = mat_2, dir = dir_2, rhs = rhs_2)

    lc_3 <- rbind(lc_1, lc_2)
    stopifnot( ((nrow(lc_1) + nrow(lc_2)) == nrow(lc_3)) )
}

test.combine_F_constraints <- function() {
    fc1 <- F_constraint(F=function(x) x[1] + x[2]^2, ">=", 0,
                        J=function(x) c(1, 2*x[2]))
    fc2 <- F_constraint(F=function(x) x[1]^2 + x[2], ">=", 0,
                        J=function(x) c(2*x[1], x[2]))
    c(fc1, fc2)    
}

## as

## is

## G

## J

## variable.names


## ---------------------------
## test 
## ---------------------------
file = Sys.getenv("ROI_TEST_LOG_FILE")
ROI_TEST_ERRORS <- 0L
rt <- function(expr, silent = FALSE) {
    err <- try(expr, silent = silent)
    if ( inherits(err, "try-error") ) 
        ROI_TEST_ERRORS <<- ROI_TEST_ERRORS + 1L
    err
}

cat("# Constructors\n", file=file)
cat("## Objective\n", file=file)
cat("### L_objective\n", file=file)
rt( test.L_objective() )

cat("### Q_objective\n", file=file)
rt( test.Q_objective() )

cat("### F_objective\n", file=file)
rt( test.F_objective() )

cat("## Constraints\n", file=file)

cat("## Types\n", file=file)

cat("## Bounds\n", file=file)

cat("# R-Methods\n", file=file)

cat("## Combine\n", file=file)
cat("## Combine L_constraints\n", file=file)
rt( test.combine_L_constraints() )

if ( ROI_TEST_ERRORS ) {
    stop(ROI_TEST_ERRORS, " errors occured")
}
