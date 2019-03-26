library(additiveDEA)


### Name: dea.gem
### Title: Generalized Efficiency Measures (Additive DEA Models)
### Aliases: dea.gem
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
# lambdas and slacks for all DMUs, with each GEM:
models <- c("additive", "RAM", "BAM", "MIP", "LovPast")
for(i in models) {
  print(i)
  results <- dea.gem(base, noutput= 2, add.model= i)
  print(results)
}

# Example 2: Same as above, but consider output y2 and input x1 as fixed:
for(i in models) {
  print(i)
  results <- dea.gem(base, noutput= 2, add.model= i, fixed= c(2, 3))
  print(results)
}

# Example 3: Impose upper bounds to slacks and get BAM inefficiency:
# upper-sided range for output:
Uo <- sweep(-base[c(1,2)], 2,
  apply(base[c(1,2)], 2, max), '+')
# lower-sided range for input
Li <- sweep(base[c(3,4)], 2,
  apply(base[c(3,4)], 2, min), '-')
# ensure bounds are <= the sided ranges:
bound <- cbind(Uo, Li)/2
# results with bounds:
dea.gem(base, noutput= 2, add.model= "BAM", bound= bound)$eff
# removing bounds allows for larger inefficiencies:
dea.gem(base, noutput= 2, add.model= "BAM", bound= NULL)$eff
# check solution status of linear programs when y2 and x1 are fixed
# and y1, x2 slacks are bounded:
fixed <- c(2,3)
bound[fixed] <- 0
for(i in models) {
  print(i)
  results <- dea.gem(base, noutput= 2, add.model= i,
    bound= bound, fixed= c(2, 3), rts= 1, print.status= TRUE)[[2]]
  print(results)
}

# Example 4: Get inefficiency scores for DMUs 11 and 12:
bound <- base
fixed <- c(2,3)
bound[fixed] <- 0
for(i in models) {
  print(i)
  results <- dea.gem(base, noutput= 2, add.model= i,
    bound= base, fixed= c(2, 3), rts= 1, whichDMUs= c(11, 12))$eff
  print(results)
}

# Example 5: a typical scaling problem in linear programing
# and how to deal with it:
# get data from package Benchmarking:
library(Benchmarking)
data(pigdata)
base <- pigdata[, 2:9][, c(7,8,1:6)]
results <- dea.gem(base, noutput= 2, rts= 1,
  add.model= 'RAM', print.status= TRUE)
# inefficiency for DMU 37 is NA:
which(is.na(results[[1]]$eff))
# error status: 5, i.e. scaling problem:
results[[2]][37]
# scale data:
results <- dea.gem(base/1000, noutput= 2, rts= 1,
  add.model= 'RAM', print.status= TRUE)
which(is.na(results[[1]]$eff)) # problem solved!

## The function is currently defined as
function (base, noutput, fixed = NULL, rts = 2, bound = NULL, 
    add.model = c("additive", "RAM", "BAM", "MIP", "LovPast"), 
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
    lpmodel <- make.lp(nrow = 0, ncol = n + s + m)
    slacks <- diag(s + m)
    slacks[1:s, ] <- -slacks[1:s, ]
    type <- rep("=", s + m)
    if (!is.null(fixed)) {
        slacks[, fixed] <- 0
        type[fixed[fixed <= s]] <- ">="
        type[fixed[fixed > s]] <- "<="
    }
    A <- cbind(t(base), slacks)
    for (i in 1:(s + m)) {
        add.constraint(lpmodel, xt = A[i, ], type = type[i], 
            rhs = 0)
    }
    if (add.model == "BAM") {
        Uo <- t(apply(data.frame(base[, 1:s]), 2, max) - t(base[, 
            1:s]))
        Li <- t(t(base[, (s + 1):(s + m)]) - apply(data.frame(base[, 
            (s + 1):(s + m)]), 2, min))
        if (!is.null(bound) & rts == 1) {
            index1 <- which(colSums(bound) == 0)
            bound[, index1] <- data.frame(Uo, Li)[, index1]
            if (!is.null(fixed)) {
                bound[fixed] <- 0
            }
        }
        if (is.null(bound) & rts == 1) {
            bound <- data.frame(Uo, Li)
            if (!is.null(fixed)) {
                bound[fixed] <- 0
            }
        }
    }
    if (add.model == "RAM") {
        Ro <- apply(data.frame(base[, 1:s]), 2, max) - apply(data.frame(base[, 
            1:s]), 2, min)
        Ri <- apply(data.frame(base[, (s + 1):(s + m)]), 2, max) - 
            apply(data.frame(base[, (s + 1):(s + m)]), 2, min)
        if (!is.null(bound) & rts == 1) {
            index1 <- which(colSums(bound) == 0)
            bound[, index1] <- t(as.data.frame(matrix(c(Ro, Ri), 
                nrow = s + m, ncol = nrow(base))))[, index1]
            if (!is.null(fixed)) {
                bound[fixed] <- 0
            }
        }
        if (is.null(bound) & rts == 1) {
            bound <- t(as.data.frame(matrix(c(Ro, Ri), nrow = s + 
                m, ncol = nrow(base))))
            if (!is.null(fixed)) {
                bound[fixed] <- 0
            }
        }
    }
    if (!is.null(bound)) {
        index <- which(colSums(bound) != 0)
        nrows <- length(index)
        A.bound <- matrix(0, nrow = nrows, ncol = n + s + m)
        k <- 0
        for (i in index) {
            k <- k + 1
            A.bound[k, n + index[k]] <- 1
        }
        A <- rbind(A, A.bound)
        for (i in 1:k) {
            add.constraint(lpmodel, xt = A[s + m + i, ], type = "<=", 
                rhs = 0)
        }
    }
    syx <- rep(-1, s + m)
    syx[fixed] <- 0
    if (add.model == "additive") {
        set.objfn(lpmodel, c(rep(0, n), syx))
    }
    if (add.model == "RAM") {
        Ro[Ro == 0] <- Inf
        Ri[Ri == 0] <- Inf
        Ranges <- (1/c(Ro, Ri))/abs(sum(syx))
        set.objfn(lpmodel, c(rep(0, n), as.numeric(syx * Ranges)))
    }
    if (add.model == "LovPast") {
        st.dev <- apply(base, 2, sd)
        st.dev[st.dev == 0] <- Inf
        set.objfn(lpmodel, c(rep(0, n), syx/st.dev))
    }
    k <- 0
    if (print.status == TRUE) {
        ifelse(!is.null(whichDMUs), solution.status <- rep(0, 
            nn), solution.status <- rep(0, n))
    }
    if (rts == 2 & is.null(bound)) {
        add.constraint(lpmodel, xt = c(rep(1, n), rep(0, s + 
            m)), type = "=", rhs = 0)
        for (i in whichDMUs) {
            k <- k + 1
            if (add.model == "MIP") {
                set.objfn(lpmodel, c(rep(0, n), as.numeric(syx/base[i, 
                  ])))
            }
            if (add.model == "BAM") {
                Uo[i, ][Uo[i, ] == 0] <- Inf
                Li[i, ][Li[i, ] == 0] <- Inf
                Ranges <- (1/c(Uo[i, ], Li[i, ]))/abs(sum(syx))
                set.objfn(lpmodel, c(rep(0, n), as.numeric(syx * 
                  Ranges)))
            }
            set.rhs(lpmodel, b = as.numeric(c(base[i, ], 1)))
            x <- solve(lpmodel)
            if (print.status == TRUE) {
                solution.status[k] <- x
            }
            re[k, ] <- c(-get.objective(lpmodel), tail(get.primal.solution(lpmodel), 
                s + m + n))
            if (x != 0) {
                re[k, ] <- rep(NA, ncol(re))
            }
        }
    }
    if (rts == 2 & !is.null(bound)) {
        add.constraint(lpmodel, xt = c(rep(1, n), rep(0, s + 
            m)), type = "=", rhs = 0)
        for (i in whichDMUs) {
            k <- k + 1
            if (add.model == "MIP") {
                set.objfn(lpmodel, c(rep(0, n), as.numeric(syx/base[i, 
                  ])))
            }
            if (add.model == "BAM") {
                Uo[i, ][Uo[i, ] == 0] <- Inf
                Li[i, ][Li[i, ] == 0] <- Inf
                Ranges <- (1/c(Uo[i, ], Li[i, ]))/abs(sum(syx))
                set.objfn(lpmodel, c(rep(0, n), as.numeric(syx * 
                  Ranges)))
            }
            if (add.model %in% c("RAM", "BAM")) {
                set.rhs(lpmodel, b = as.numeric(c(base[i, ], 
                  bound[i, index], 1)))
            }
            if (sum(add.model == c("RAM", "BAM")) == 0) {
                bound[bound == 0] <- 10^10
                set.rhs(lpmodel, b = as.numeric(c(base[i, ], 
                  bound[i, index], 1)))
            }
            solve(lpmodel)
            x <- solve(lpmodel)
            if (print.status == TRUE) {
                solution.status[k] <- x
            }
            re[k, ] <- c(-get.objective(lpmodel), tail(get.primal.solution(lpmodel), 
                s + m + n))
            if (x != 0) {
                re[k, ] <- rep(NA, ncol(re))
            }
        }
    }
    if (rts == 1 & is.null(bound)) {
        for (i in whichDMUs) {
            k <- k + 1
            if (add.model == "MIP") {
                set.objfn(lpmodel, c(rep(0, n), as.numeric(syx/base[i, 
                  ])))
            }
            set.rhs(lpmodel, b = as.numeric(base[i, ]))
            x <- solve(lpmodel)
            if (print.status == TRUE) {
                solution.status[k] <- x
            }
            re[k, ] <- c(-get.objective(lpmodel), tail(get.primal.solution(lpmodel), 
                s + m + n))
            if (x != 0) {
                re[k, ] <- rep(NA, ncol(re))
            }
        }
    }
    if (rts == 1 & !is.null(bound)) {
        for (i in whichDMUs) {
            k <- k + 1
            if (add.model == "MIP") {
                set.objfn(lpmodel, c(rep(0, n), as.numeric(syx/base[i, 
                  ])))
            }
            if (add.model == "BAM") {
                Uo[i, ][Uo[i, ] == 0] <- Inf
                Li[i, ][Li[i, ] == 0] <- Inf
                Ranges <- (1/c(Uo[i, ], Li[i, ]))/abs(sum(syx))
                set.objfn(lpmodel, c(rep(0, n), as.numeric(syx * 
                  Ranges)))
            }
            if (add.model %in% c("RAM", "BAM")) {
                set.rhs(lpmodel, b = as.numeric(c(base[i, ], 
                  bound[i, index])))
            }
            if (sum(add.model == c("RAM", "BAM")) == 0) {
                bound[bound == 0] <- 10^10
                set.rhs(lpmodel, b = as.numeric(c(base[i, ], 
                  bound[i, index])))
            }
            x <- solve(lpmodel)
            if (print.status == TRUE) {
                solution.status[k] <- x
            }
            ifelse(x != 0, re[k, ] <- rep(NA, ncol(re)), re[k, 
                ] <- c(-get.objective(lpmodel), tail(get.primal.solution(lpmodel), 
                s + m + n)))
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



