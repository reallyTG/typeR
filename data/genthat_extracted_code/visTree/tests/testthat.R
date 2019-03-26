library(testthat)
library(visTree)
library(partykit)
context("Prediction")

n <- 100
set.seed(10)
x1 <- rnorm(n)
x2 <- rnorm(n)
x3 <- rnorm(n)
Z <- matrix(cbind(x1, x2, x3), ncol = 3)
colnames(Z) <- paste0("x", 1:3)

Bl <- matrix(c(B1 = 1, B2 = 2, B3 = 1.5), nrow = 3)
Y <- rnorm(n, mean = Z %*% Bl, sd = 1)
Yl <- cbind(Z, Y)
Y.trainl <- as.data.frame(Yl)

# Conditional Inference tree
cond.tree1 <- ctree(Y ~ x1 + x2 + x3, data = Y.trainl, control = ctree_control(mincriterion = 0.65))

first_termnode <- partykit::nodeids(cond.tree1, terminal = TRUE)[1]
obs.first_tnode <- which(data_party(cond.tree1)$"(fitted)" == first_termnode)
term_mean <- mean(data_party(cond.tree1)$"(response)"[obs.first_tnode])
choose_inner <- nodeids(cond.tree1, terminal = FALSE) %in% nodeids(cond.tree1, terminal = TRUE)
index_left <- nodeids(cond.tree1)[!choose_inner][2]
index_right <- nodeids(cond.tree1)[!choose_inner][5]

test_that("Prediction_terminal node", {
  expect_equal(ptree_y(cond.tree1, first_termnode), term_mean)
})

test_that("Inner nodes - Left split", {
  expect_equal(ptree_left(cond.tree1, 1), nodeids(cond.tree1)[index_left])
})

test_that("Inner nodes - Right split", {
  expect_equal(ptree_right(cond.tree1, 1), nodeids(cond.tree1)[index_right])
})

first_split <- strsplit(partykit:::.list.rules.party(cond.tree1)[1], " & ")[[1]][1]
test_that("Split_node", {
  expect_equal(ptree_criteria(cond.tree1, 1, TRUE), first_split)
})

########################################################################

if (inherits(cond.tree1, "constparty")) {
  splittree <- path_node(cond.tree1)
} else {
  splittree <- path_node(as.party(cond.tree1))
}
structure <- strsplit(splittree, split = ";")
if (inherits(cond.tree1, "constparty")) {
  terminal.id <- nodeids(cond.tree1, terminal = TRUE)
} else {
  terminal.id <- nodeids(as.party(cond.tree1), terminal = TRUE)
}
if (length(structure[[1]]) == length(terminal.id)) {
  structure[[1]] <- sapply(1:length(structure[[1]]), function(i) {
    paste0(structure[[1]][i], ",", terminal.id[i], " ")
  })
}

if (inherits(cond.tree1, "constparty")) {
  input.info <- data_party(cond.tree1)
  #  X <- input.info[,2:(length(input.info)-3)]
  X <- input.info[, 2:(length(input.info) - 3)]
  Y <- fitted(cond.tree1)[[3]]
} else {
  input.info <- data_party(as.party(cond.tree1))
  #  X <- input.info[,2:(length(input.info)-3)]
  X <- input.info[, 2:(length(input.info) - 2)]
  Y <- fitted(as.party(cond.tree1))[[2]]
}

if (is.factor(Y)) {
  n.terminals <- length(structure[[1]])
  # prob.mat <- matrix(data=unlist(lapply(structure[[1]],function(S) {
  # unlist(lapply(strsplit(S,","),function(split.S) {
  # seg <- unlist(split.S[length(split.S)])
  # as.numeric(trim(strsplit(seg,"=")[[1]][2]))
  # }))
  # })), nrow=n.terminals)
  y.list <- sapply(1:length(structure[[1]]), function(j) {
    seg <- strsplit(structure[[1]], ",")
    if (interval == TRUE) {
      paste0(seg[[j]][c((length(seg[[j]]) - 2):(length(seg[[j]]) - 1))], collapse = ",")
    } else {
      paste0(seg[[j]][length(seg[[j]]) - 2], collapse = ",")
    }
  })

  x.list <- sapply(1:length(structure[[1]]), function(j) {
    seg <- strsplit(structure[[1]], ",")
    x.l <- sapply(1:length(seg), function(i) {
      if (interval == TRUE) {
        x.length <- length(seg[[i]]) - 3
      } else {
        x.length <- length(seg[[i]]) - 2
      }
    })
    if (interval == TRUE) {
      paste0(seg[[j]][1:(length(seg[[j]]) - 3)], collapse = ",")
    } else {
      paste0(seg[[j]][1:(length(seg[[j]]) - 2)], collapse = ",")
    }
  })

  term.node <- sapply(1:length(structure[[1]]), function(j) {
    seg <- strsplit(structure[[1]], ",")
    if (interval == TRUE) {
      paste0(tail(seg[[j]], 1), collapse = ",")
    } else {
      paste0(tail(seg[[j]], 1), collapse = ",")
    }
  })

  structure <- lapply(1:length(y.list), function(i) {
    paste0(x.list[[i]], ", ", y.list[[i]], ", ", term.node[[i]])
  })
}
if (length(unlist(structure)) == 1) {
  stop("Tree has only a single node; nothing to visualize.")
}
# terminal.id<-nodeids(cond.tree, terminal = TRUE)
rng <- NULL
n.terminals <- ifelse(is.null(rng), length(unlist(structure)), length(rng))
if (is.null(rng)) {
  index <- 1:n.terminals
} else {
  index <- min(rng):min(max(rng), length(unlist(structure)))
} ## Should probably do some range checking
if (length(index) > 10) stop("Number of subgroups is too large")

par(mfrow = c(4, ceiling(length(index) / 2)), mar = c(2, 1, 3, 1))
number <- length(index) * 2 + (length(index) * 2) %% 4
layout(matrix(1:number, 4, ceiling(length(index) / 2)))

S <- unlist(structure)[index]
My <- minmax_mat(S, colnames(X), Y, FALSE)
myy <- as.numeric(strsplit(My$y, " ")[[1]][3])

test_that("minmax", {
  expect_equal(as.numeric(strsplit(minmax_mat(S, colnames(X), Y, FALSE)$y, " ")[[1]][3]), term_mean)
})

test_that("Pathnode", {
  expect_equal(as.numeric(strsplit(strsplit(path_node(cond.tree1, 4), ",")[[1]][4], " ")[[1]][3]), term_mean)
})
