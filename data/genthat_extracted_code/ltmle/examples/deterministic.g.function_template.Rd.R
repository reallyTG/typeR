library(ltmle)


### Name: deterministic.g.function_template
### Title: Deterministic g/Q functions - examples and templates
### Aliases: deterministic.g.function_template MaintainTreatment
###   MaintainControl deterministic.Q.function_template

### ** Examples


# Show template for a deterministic.g.function (comments will not be
# shown, see below for comments)
deterministic.g.function_template

# Show template for a deterministic.Q.function (comments will not be
# shown, see below for comments)
deterministic.Q.function_template

# Use MaintainTreatment
set.seed(1)
rexpit <- function(x) rbinom(n = length(x), size = 1, prob = plogis(x))
n <- 100
W <- rnorm(n)
A1 <- rexpit(W)
A2 <- as.numeric(rexpit(W) | A1)  #treatment at time 1 implies treatment at time 2
Y <- rexpit(W + A1 + A2 + rnorm(n))
data <- data.frame(W, A1, A2, Y)

result <- ltmle(data, Anodes = c("A1", "A2"), Ynodes = "Y", abar = c(1, 1), 
    deterministic.g.function = MaintainTreatment)

# deterministic.g.function_template with comments:

deterministic.g.function_template <- function(data, current.node, nodes) {
    # data: the 'data' data.frame passed to ltmle/ltmleMSM current.node: the
    # column index of data corresponding to the A or C node (see
    # is.deterministic below) nodes: list of column indicies, components: A,
    # C, L, Y, AC (Anodes and Cnodes combined and sorted), LY (Lnodes and
    # Ynodes combined, sorted, 'blocks' removed - see ?ltmle) Note that nodes
    # may be passed to ltmle as either the names of nodes or numerical column
    # indicies, but they are all converted to numerical indicies before
    # deterministic.g.function is called
    
    # deterministic.g.function will be called at all Anodes and Cnodes
    # return(NULL) is equivalent to return(list(is.deterministic=rep(FALSE,
    # nrow(data)), prob1=numeric(0)))
    
    # define is.deterministic here: vector of logicals, length=nrow(data)
    # define prob1 here: the probability that data[is.deterministic,
    # current.node] == 1, vector of length 1 or
    # length(which(is.deterministic))
    is.deterministic <- stop("replace me!")
    prob1 <- stop("replace me!")
    return(list(is.deterministic = is.deterministic, prob1 = prob1))
}

# deterministic.Q.function_template with comments:

deterministic.Q.function_template <- function(data, current.node, nodes, 
    called.from.estimate.g) {
    # data: the 'data' data.frame passed to ltmle/ltmleMSM current.node: the
    # column index of data corresponding to the A or C node (see
    # is.deterministic below) nodes: list of column indicies, components: A,
    # C, L, Y, AC (Anodes and Cnodes combined and sorted), LY (Lnodes and
    # Ynodes combined, sorted, 'blocks' removed - see ?ltmle)
    # called.from.estimate.g: TRUE or FALSE - your function will be called
    # with called.from.estimate.g=TRUE during estimation of g and
    # called.from.estimate.g=FALSE during estimation of Q. During estimation
    # of g, only the is.deterministic element of the return list will be
    # used.  Note that nodes may be passed to ltmle as either the names of
    # nodes or numerical column indicies, but they are all converted to
    # numerical indicies before deterministic.Q.function is called
    
    # It is not necessary to specify that deterministic Y events (Y==1)
    # indicate a deterministic Q value of 1; this is automatic 
    # if the survivalFunction input to ltmle/ltmleMSM is TRUE.
    # deterministic.Q.function will be called at all Lnodes and Ynodes (after
    # removing 'blocks') and Anodes and Cnodes (see called.from.estimate.g
    # above) return(NULL) is equivalent to
    # return(list(is.deterministic=rep(FALSE, nrow(data)),
    # Q.value=numeric(0)))
    
    # define is.deterministic here: vector of logicals, length=nrow(data)
    # define Q.value here: the iterated expectation of the final Y, vector of
    # length 1 or length(which(is.deterministic))
    is.deterministic <- stop("replace me!")
    Q.value <- stop("replace me!")
    return(list(is.deterministic = is.deterministic, Q.value = Q.value))
}




