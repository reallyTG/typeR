library(additiveDEA)


### Name: dea.sbm
### Title: Slacks-Based Measure (SBM) of Efficiency
### Aliases: dea.sbm
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Twelve DMUs, 2 inputs, 2 outputs
# (see Table 1.5 in Cooper et al., 2007):
base <- data.frame(
  y1= c(100,150,160,180,94,230,220,152,190,250,260,250),
  y2= c(90,50,55,72,66,90,88,80,100,100,147,120),
  x1= c(20,19,25,27,22,55,33,31,30,50,53,38),
  x2= c(151,131,160,168,158,255,235,206,244,268,306,284))
  
# Example 1: Get inefficiency scores,
# lambdas and slacks for all DMUs:
dea.sbm(base, noutput= 2, rts= 1)
dea.sbm(base, noutput= 2, rts= 2)

# Example 2: Same as above, but consider output y2 and input x1 as fixed:
dea.sbm(base, noutput= 2, rts= 1, fixed= c(2,3))
dea.sbm(base, noutput= 2, rts= 2, fixed= c(2,3))

# Example 3: Impose an upper bound to all slacks:
# results with bounds
dea.sbm(base, noutput= 2, rts= 1, bound= base/12)$eff
# removing bounds allows for larger inefficiencies:
dea.sbm(base, noutput= 2, rts= 1, bound= NULL)$eff
# check solution status of linear programs when y2 and x1 are fixed
# and y1, x2 slacks are bounded:
bound <- base
fixed <- c(2,3)
bound[fixed] <- 0
dea.sbm(base, noutput= 2, bound= bound,
  fixed= c(2, 3), rts= 1, print.status= TRUE)[[2]]
dea.sbm(base, noutput= 2, bound= bound,
  fixed= c(2, 3), rts= 2, print.status= TRUE)[[2]]

# Example 4: Get inefficiency scores for DMUs 11 and 12:
bound <- base
fixed <- c(2,3)
bound[fixed] <- 0
dea.sbm(base, noutput= 2, bound= bound,
  fixed= c(2, 3), rts= 1, whichDMUs= c(11, 12))$eff
dea.sbm(base, noutput= 2, bound= bound,
  fixed= c(2, 3), rts= 2, whichDMUs= c(11, 12))$eff

## The function is currently defined as
function (base, noutput, fixed = NULL, rts = 2, bound = NULL, 
    whichDMUs = NULL, print.status = FALSE) 
{
    s <- noutput
    m <- ncol(base) - s
    n <- nrow(base)
    ifelse(!is.null(whichDMUs), nn <- length(whichDMUs), nn <- n)
    if (is.null(whichDMUs)) {
        whichDMUs <- 1:n
    }
    re <- data.frame(matrix(0, nrow = nn, ncol = 1 + n + s + 
        m))
    names(re) <- c("eff", paste("lambda", 1:n, sep = ""), paste("slack.y", 
        1:s, sep = ""), paste("slack.x", 1:m, sep = ""))
    slacks <- diag(s + m)
    slacks[1:s, ] <- -slacks[1:s, ]
    type <- rep("=", s + m)
    if (!is.null(fixed)) {
        slacks[, fixed] <- 0
        type[fixed[fixed <= s]] <- ">="
        type[fixed[fixed > s]] <- "<="
    }
    k <- 0
    A.aux <- cbind(t(base), slacks)
    index.fixed.y <- fixed[which(fixed %in% 1:s)]
    index.fixed.x <- fixed[which(fixed %in% (s + 1):(s + m))]
    S <- s - length(index.fixed.y)
    M <- m - length(index.fixed.x)
    if (print.status == TRUE) {
        ifelse(!is.null(whichDMUs), solution.status <- rep(0, 
            nn), solution.status <- rep(0, n))
    }
    if (rts == 2 & is.null(bound)) {
        for (i in whichDMUs) {
            k <- k + 1
            lpmodel <- make.lp(nrow = 0, ncol = 1 + n + s + m)
            A <- cbind(-t(base)[, i], A.aux)
            xt <- as.numeric((1/S) * (1/base[i, 1:s]))
            if (!is.null(fixed)) {
                xt[index.fixed.y] <- 0
            }
            xt <- c(1, rep(0, n), xt, rep(0, m))
            add.constraint(lpmodel, xt = xt, type = "=", rhs = 0)
            for (j in 1:(s + m)) {
                add.constraint(lpmodel, xt = A[j, ], type = type[j], 
                  rhs = 0)
            }
            add.constraint(lpmodel, xt = c(-1, rep(1, n), rep(0, 
                s + m)), type = "=", rhs = 0)
            set.rhs(lpmodel, b = c(1, rep(0, s + m + 1)))
            obj <- as.numeric((-1/M) * (1/base[i, (s + 1):(s + 
                m)]))
            if (!is.null(fixed)) {
                obj[index.fixed.x - s] <- 0
            }
            obj <- c(1, rep(0, n + s), obj)
            set.objfn(lpmodel, obj = obj)
            x <- solve(lpmodel)
            if (print.status == TRUE) {
                solution.status[k] <- x
            }
            re[k, ] <- c(get.objective(lpmodel), tail(get.primal.solution(lpmodel), 
                n + s + m)/get.primal.solution(lpmodel)[1 + 1 + 
                s + m + 1 + 1])
            if (x != 0) {
                re[k, ] <- rep(NA, ncol(re))
            }
        }
    }
    if (rts == 2 & !is.null(bound)) {
        index <- which(colSums(bound) != 0)
        nrows <- length(index)
        A.bound <- matrix(0, nrow = nrows, ncol = n + s + m)
        kk <- 0
        for (i in index) {
            kk <- kk + 1
            A.bound[kk, n + index[kk]] <- 1
        }
        A.bound <- cbind(0, A.bound)
        for (i in whichDMUs) {
            A.bound <- matrix(0, nrow = nrows, ncol = n + s + 
                m)
            kk <- 0
            for (j in index) {
                kk <- kk + 1
                A.bound[kk, n + index[kk]] <- 1
            }
            A.bound <- cbind(0, A.bound)
            k <- k + 1
            lpmodel <- make.lp(nrow = 0, ncol = 1 + n + s + m)
            A <- cbind(-t(base)[, i], A.aux)
            A.bound[, 1] <- as.numeric(-bound[i, index])
            A.bound[A.bound[, 1] == 0, ] <- 0
            A <- rbind(A, A.bound)
            xt <- as.numeric((1/S) * (1/base[i, 1:s]))
            if (!is.null(fixed)) {
                xt[index.fixed.y] <- 0
            }
            xt <- c(1, rep(0, n), xt, rep(0, m))
            add.constraint(lpmodel, xt = xt, type = "=", rhs = 0)
            for (j in 1:(s + m)) {
                add.constraint(lpmodel, xt = A[j, ], type = type[j], 
                  rhs = 0)
            }
            add.constraint(lpmodel, xt = c(-1, rep(1, n), rep(0, 
                s + m)), type = "=", rhs = 0)
            for (l in 1:kk) {
                add.constraint(lpmodel, xt = A[s + m + l, ], 
                  type = "<=", rhs = 0)
            }
            set.rhs(lpmodel, b = c(1, rep(0, s + m + 1 + l)))
            obj <- as.numeric((-1/M) * (1/base[i, (s + 1):(s + 
                m)]))
            if (!is.null(fixed)) {
                obj[index.fixed.x - s] <- 0
            }
            obj <- c(1, rep(0, n + s), obj)
            set.objfn(lpmodel, obj = obj)
            x <- solve(lpmodel)
            if (print.status == TRUE) {
                solution.status[k] <- x
            }
            re[k, ] <- c(get.objective(lpmodel), tail(get.primal.solution(lpmodel), 
                n + s + m)/get.primal.solution(lpmodel)[1 + 1 + 
                s + m + 1 + sum(colSums(bound) != 0) + 1])
            if (x != 0) {
                re[k, ] <- rep(NA, ncol(re))
            }
        }
    }
    if (rts == 1 & is.null(bound)) {
        for (i in whichDMUs) {
            k <- k + 1
            lpmodel <- make.lp(nrow = 0, ncol = 1 + n + s + m)
            A <- cbind(-t(base)[, i], A.aux)
            xt <- as.numeric((1/S) * (1/base[i, 1:s]))
            if (!is.null(fixed)) {
                xt[index.fixed.y] <- 0
            }
            xt <- c(1, rep(0, n), xt, rep(0, m))
            add.constraint(lpmodel, xt = xt, type = "=", rhs = 0)
            for (j in 1:(s + m)) {
                add.constraint(lpmodel, xt = A[j, ], type = type[j], 
                  rhs = 0)
            }
            set.rhs(lpmodel, b = c(1, rep(0, s + m)))
            obj <- as.numeric((-1/M) * (1/base[i, (s + 1):(s + 
                m)]))
            if (!is.null(fixed)) {
                obj[index.fixed.x - s] <- 0
            }
            obj <- c(1, rep(0, n + s), obj)
            set.objfn(lpmodel, obj = obj)
            x <- solve(lpmodel)
            if (print.status == TRUE) {
                solution.status[k] <- x
            }
            re[k, ] <- c(get.objective(lpmodel), tail(get.primal.solution(lpmodel), 
                n + s + m)/get.primal.solution(lpmodel)[1 + 1 + 
                s + m + 1])
            if (x != 0) {
                re[k, ] <- rep(NA, ncol(re))
            }
        }
    }
    if (rts == 1 & !is.null(bound)) {
        index <- which(colSums(bound) != 0)
        nrows <- length(index)
        A.bound <- matrix(0, nrow = nrows, ncol = n + s + m)
        kk <- 0
        for (i in index) {
            kk <- kk + 1
            A.bound[kk, n + index[kk]] <- 1
        }
        A.bound <- cbind(0, A.bound)
        for (i in whichDMUs) {
            k <- k + 1
            lpmodel <- make.lp(nrow = 0, ncol = 1 + n + s + m)
            A <- cbind(-t(base)[, i], A.aux)
            A.bound[, 1] <- as.numeric(-bound[i, index])
            A.bound[A.bound[, 1] == 0, ] <- 0
            A <- rbind(A, A.bound)
            xt <- as.numeric((1/S) * (1/base[i, 1:s]))
            if (!is.null(fixed)) {
                xt[index.fixed.y] <- 0
            }
            xt <- c(1, rep(0, n), xt, rep(0, m))
            add.constraint(lpmodel, xt = xt, type = "=", rhs = 0)
            for (j in 1:(s + m)) {
                add.constraint(lpmodel, xt = A[j, ], type = type[j], 
                  rhs = 0)
            }
            for (l in 1:kk) {
                add.constraint(lpmodel, xt = A[s + m + l, ], 
                  type = "<=", rhs = 0)
            }
            set.rhs(lpmodel, b = c(1, rep(0, s + m + l)))
            obj <- as.numeric((-1/M) * (1/base[i, (s + 1):(s + 
                m)]))
            if (!is.null(fixed)) {
                obj[index.fixed.x - s] <- 0
            }
            obj <- c(1, rep(0, n + s), obj)
            set.objfn(lpmodel, obj = obj)
            x <- solve(lpmodel)
            if (print.status == TRUE) {
                solution.status[k] <- x
            }
            re[k, ] <- c(get.objective(lpmodel), tail(get.primal.solution(lpmodel), 
                n + s + m)/get.primal.solution(lpmodel)[1 + 1 + 
                s + m + sum(colSums(bound) != 0) + 1])
            if (x != 0) {
                re[k, ] <- rep(NA, ncol(re))
            }
        }
    }
    if (!is.null(fixed)) {
        re <- re[, -(1 + n + fixed)]
    }
    if (print.status == TRUE) {
        reList <- list()
        reList[[1]] <- re
        reList[[2]] <- solution.status
        names(reList[[2]]) <- whichDMUs
        re <- reList
    }
    return(re)
  }



