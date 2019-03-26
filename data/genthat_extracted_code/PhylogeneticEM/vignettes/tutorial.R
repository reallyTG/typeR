## ---- label="load", message=FALSE----------------------------------------
library(PhylogeneticEM)

## ---- label="Simus_tree"-------------------------------------------------
set.seed(17920902)
ntaxa = 80
tree <- TreeSim::sim.bd.taxa.age(n = ntaxa, numbsim = 1, lambda = 0.1, mu = 0,
                                 age = 1, mrca = TRUE)[[1]]

## ---- label="Parameters"-------------------------------------------------
params <- params_process("OU",                             ## Process
                         p = 2,                            ## Dimension
                         variance = diag(0.5, 2, 2) + 0.5, ## Rate matrix
                         selection.strength = 3,           ## Selection Strength
                         random = TRUE,                    ## Root is random
                         stationary.root = TRUE,           ## Root is stationary
                         edges = c(29, 89, 127),           ## Positions of the shifts
                         values = cbind(c(5, 4),           ## Values of the shifts
                                        c(-4, -5),
                                        c(5, -3)))

## ---- fig.show='hold', fig.height=3, fig.width=3.4-----------------------
plot(params, phylo = tree, traits = 1, value_in_box = TRUE, shifts_bg = "white")
plot(params, phylo = tree, traits = 2, value_in_box = TRUE, shifts_bg = "white")

## ---- label="Simu_process", message=FALSE--------------------------------
sim <- simul_process(params, tree)

## ---- label="extraction"-------------------------------------------------
data <- extract(sim,             ## The simul_process object
                what = "states", ## We want the actual values
                where = "tips")  ## Only at the tips of the tree

## ---- label="rownames"---------------------------------------------------
rownames(data) <- c("A", "B")

## ---- fig.show='hold', fig.height=4, fig.width=7-------------------------
plot(params, phylo = tree, data = data)

## ------------------------------------------------------------------------
nMiss <- floor(ntaxa * 2 * 0.1)                       ## 10% of missing data
miss <- sample(1:(2 * ntaxa), nMiss, replace = FALSE) ## sample missing randomly
chars <- (miss - 1) %% 2 + 1                          ## Trace back rows and columns
tips <- (miss - 1) %/% 2 + 1
for (i in 1:nMiss){
  data[chars[i], tips[i]] <- NA                       ## Forget some values
}

## ---- label="Fit_EM", warning=FALSE--------------------------------------
## Grid on alpha
alpha_grid <- c(1, 3)

## Run algorithm
res <- PhyloEM(phylo = tree,
               Y_data = data,
               process = "scOU",                   ## scalar OU model
               random.root = TRUE,                 ## Root is stationary (true model)
               stationary.root = TRUE,
               alpha = alpha_grid,                 ## On a grid of alpha
               K_max = 10,                         ## Maximal number of shifts
               parallel_alpha = TRUE,              ## This can be set to TRUE for
               Ncores = 2)                         ## parallel computations
res

## ---- fig.show='hold', fig.height=4, fig.width=7, warning=FALSE----------
plot(res)

## ---- fig.show='hold', fig.height=4, fig.width=4, warning=FALSE----------
plot_criterion(res)

## ---- eval=FALSE---------------------------------------------------------
#  plot(res, params = params_process(res, method.selection = "DDSE"))

## ---- fig.show='hold', fig.height=4, fig.width=7, warning=FALSE----------
plot(res, params = params_process(res, K = 3, alpha = 1))

## ------------------------------------------------------------------------
params_process(res, K = 3, alpha = 1)$shifts
params_process(res, K = 3, alpha = 3)$shifts

## ------------------------------------------------------------------------
params_8 <- params_process(res, K = 8)

## ---- fig.show='hold', fig.height=4, fig.width=8, warning=FALSE----------
plot(equivalent_shifts(tree, params_8))

