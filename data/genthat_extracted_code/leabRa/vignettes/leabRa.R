## ---- message = F--------------------------------------------------------
library(leabRa)

## ------------------------------------------------------------------------
set.seed(07221904)

## ------------------------------------------------------------------------
dim_lays <- list(c(2, 5), c(2, 10), c(2, 5))

## ------------------------------------------------------------------------
connections <- matrix(c(0, 0, 0,
                        1, 0, 0.2,
                        0, 1, 0), nrow = 3, byrow = T)

## ------------------------------------------------------------------------
net <- network$new(dim_lays, connections)

## ------------------------------------------------------------------------
inputs_plus <- net$create_inputs(which_layers = c(1, 3),
                                 n_inputs = 15,
                                 prop_active = .3)

## ------------------------------------------------------------------------
inputs_minus <- lapply(inputs_plus, function(x) replace(x, 3, list(NULL)))

## ------------------------------------------------------------------------
n_epochs <- 10
outs <- lapply(seq(n_epochs), function(x) 
  net$learn_error_driven(inputs_minus,
                         inputs_plus))

## ------------------------------------------------------------------------
mad <- net$mad_per_epoch(outs, inputs_plus, 3)

## ---- fig.height=4, fig.show='hold', fig.width=6-------------------------
plot(mad, axes = F, pch = 16, family = "serif", type = "b",
     xlab = "epoch [#]",
     ylab = "mean absolute distance [activation]",
     ylim = c(round(min(mad), 2), round(max(mad + 0.01), 2)))
axis(1, at = seq(length(mad)), tick = T, family = "serif")
axis(2, at = seq(0, 1, 0.05), labels = seq(0, 1, 0.05), tick = T,
     family = "serif", las = 2)

## ------------------------------------------------------------------------
w_init_fun = function(x) runif(x, 0.3, 0.7)

## ------------------------------------------------------------------------
net <- network$new(dim_lays, connections,
                   w_init_fun = function(x) rnorm(x, mean = 0.6, sd = 0.1))

## ------------------------------------------------------------------------
all_weights <- net$get_weights()
all_weights
all_weights[3, 2]

## ------------------------------------------------------------------------
set.seed(22071904)

## ------------------------------------------------------------------------
animals

## ------------------------------------------------------------------------
inputs <- plyr::alply(animals, 1)

## ------------------------------------------------------------------------
inputs <- lapply(inputs, function(x) list(x, NULL))

## ------------------------------------------------------------------------
dim_lays <- list(c(6, 1), c(3, 1))
connections <- matrix(c(0, 0,
                        1, 0), nrow = 2, byrow = T)

## ------------------------------------------------------------------------
run_sim <- function(dim_lays, connections, inputs){
  net <- network$new(dim_lays, connections)
  net$learn_self_organized(inputs, random_order = TRUE)
  return(net$test_inputs(inputs))
}

## ---- message=FALSE------------------------------------------------------
n_runs <- 10
outs <- lapply(seq(n_runs), function(x) run_sim(dim_lays, connections, inputs))

## ------------------------------------------------------------------------
outs_layer_two <- lapply(outs, function(x) lapply(x, function(y) y[[2]]))
outs_layer_two <- lapply(outs_layer_two, function(x) do.call(rbind, x))
outs_layer_two <- lapply(outs_layer_two, round, 2)

## ------------------------------------------------------------------------
outs_layer_two[[3]]

## ------------------------------------------------------------------------
outs_layer_two[[1]]

## ------------------------------------------------------------------------
apply_threshold_on_row <- function(row){
  row[-which.max(row)] <- 0
  row[which.max(row)] <- 1
  return(row)
}

outs_layer_two <- lapply(outs_layer_two,
                         function(x) t(apply(x, 1, apply_threshold_on_row)))
outs_layer_two[[1]]

## ------------------------------------------------------------------------
dists <- lapply(outs_layer_two, dist, method = "binary")
dists[[1]]

## ------------------------------------------------------------------------
dists_mtrx <- lapply(dists, as.matrix)
mean_dists <- Reduce("+", dists_mtrx) / length(dists)
mean_dists

## ------------------------------------------------------------------------
colnames(mean_dists) <- rownames(animals)
rownames(mean_dists) <- rownames(animals)

## ---- fig.height=4, fig.width=6------------------------------------------
plot(hclust(as.dist(mean_dists)), main = "", sub = "", xlab = "",
     ylab = "Distance")

