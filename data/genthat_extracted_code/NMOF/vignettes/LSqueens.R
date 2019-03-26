### R code from vignette source 'LSqueens.Rnw'

###################################################
### code chunk number 1: LSqueens.Rnw:25-26
###################################################
options(continue = "  ", digits = 5, max.print = 1000)


###################################################
### code chunk number 2: LSqueens.Rnw:63-65
###################################################
library("NMOF")
set.seed(134577)


###################################################
### code chunk number 3: LSqueens.Rnw:75-78
###################################################
N <- 8              ## board size
p <- sample.int(N)  ## a random solution
data.frame(row = 1:N, column = p)


###################################################
### code chunk number 4: LSqueens.Rnw:82-84
###################################################
p <- rep(1, N) 
data.frame(row = 1:N, column = p)


###################################################
### code chunk number 5: LSqueens.Rnw:90-103
###################################################
print_board <- function(p, q.char = "Q", sep = " ") {
    n <- length(p)
    row <- rep("-", n)
    for (i in seq_len(n)) {
        row_i <- row
        row_i[p[i]] <- q.char
       
        cat(paste(row_i, collapse = sep))
        cat("\n")
    }
}

print_board(p)


###################################################
### code chunk number 6: LSqueens.Rnw:113-124
###################################################
mat <- array(NA, dim = c(N,N))  ## diagonals
for (r in 1:N)
    for (c in 1:N)
        mat[r,c] <- c - r
mat

mat <- array(NA, dim = c(N,N))  ## reverse diagonals
for (r in 1:N)
    for (c in 1:N)
        mat[r,c] <- c + r - (N + 1)
mat


###################################################
### code chunk number 7: LSqueens.Rnw:137-149
###################################################
n_attacks <- function(p) {
    ## more than one Q on a column?
    sum(duplicated(p)) +
        
    ## more than one Q on a diagonal?
    sum(duplicated(p - seq_along(p))) +   

    ## more than one Q on a reverse diagonal?
    sum(duplicated(p + seq_along(p)))
}

n_attacks(p)


###################################################
### code chunk number 8: LSqueens.Rnw:160-171
###################################################
neighbour <- function(p) {
    step <- 3
    i <- sample.int(N, 1)
    p[i] <- p[i] + sample(c(1:step, -(1:step)), 1)
    
    if (p[i] > N)
        p[i] <- 1
    else if (p[i] < 1)
        p[i] <- N
    p
}


###################################################
### code chunk number 9: LSqueens.Rnw:174-177
###################################################
print_board(p)
print_board(p <- neighbour(p))
print_board(p <- neighbour(p))


###################################################
### code chunk number 10: LSqueens.Rnw:187-207
###################################################
p0 <- rep(1, N)  ## or a random initial solution: p0 <- sample.int(N)
print_board(p0)

sol <- LSopt(n_attacks, list(x0 = p0,
                             neighbour = neighbour,
                             printBar = FALSE,
                             nS = 10000))
print_board(sol$xbest)

sol <- TAopt(n_attacks, list(x0 = p0,
                             neighbour = neighbour,
                             printBar = FALSE,
                             nS = 1000))
print_board(sol$xbest)

sol <- SAopt(n_attacks, list(x0 = p0,
                             neighbour = neighbour,
                             printBar = FALSE,
                             nS = 1000))
print_board(sol$xbest)


