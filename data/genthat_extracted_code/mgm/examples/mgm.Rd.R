library(mgm)


### Name: mgm
### Title: Estimating Mixed Graphical Models
### Aliases: mgm mgmfit

### ** Examples


## Not run: 
##D 
##D 
##D ## We fit a pairwise and 3-order MGM to the mixed Autism dataset (?autism_data)
##D 
##D # 1) Fit Pairwise MGM
##D 
##D # Call mgm()
##D fit_k2 <- mgm(data = autism_data$data,
##D               type = autism_data$type,
##D               level = autism_data$lev,
##D               k = 2) # ad most pairwise interacitons
##D 
##D # Weighted adjacency matrix
##D fit_k2$pairwise$wadj
##D 
##D # Visualize using qgraph()
##D library(qgraph)
##D qgraph(fit_k2$pairwise$wadj,
##D        edge.color = fit_k2$pairwise$edgecolor,
##D        layout = "spring",
##D        labels =  autism_data$colnames)
##D 
##D 
##D # 2) Fit MGM with pairwise & three-way interactions
##D fit_k3 <- mgm(data = autism_data$data,
##D               type = autism_data$type,
##D               level = autism_data$lev,
##D               k = 3) # include all interactions up to including order 3
##D 
##D # List of estimated interactions
##D fit_k3$interactions$indicator
##D 
##D # 3) Plot Factor Graph 
##D FactorGraph(object = fit_k3, 
##D             PairwiseAsEdge = FALSE, 
##D             labels = autism_data$colnames)
##D 
##D # 4) Predict values
##D pred_obj <- predict(fit_k3, autism_data$data)
##D 
##D head(pred_obj$predicted) # first six rows of predicted values
##D pred_obj$errors # Nodewise errors
##D 
##D 
##D ## Here we illustrate why we need to overparameterize the design matrix to 
##D ## recover higher order interactions including categorical variables
##D 
##D # 1) Define Graph (one 3-way interaction between 3 binary variables)
##D 
##D # a) General Graph Info
##D type = c("c", "c", "c")
##D level = c(2, 2, 2)
##D # b) Define Interaction
##D factors <- list()
##D factors[[1]] <- NULL # no pairwise interactions
##D factors[[2]] <- matrix(c(1,2,3), ncol=3, byrow = T) # one 3-way interaction
##D interactions <- list()
##D interactions[[1]] <- NULL
##D interactions[[2]] <- vector("list", length = 1)
##D # threeway interaction no1
##D interactions[[2]][[1]] <- array(0, dim = c(level[1], level[2], level[3]))
##D theta <- .7
##D interactions[[2]][[1]][1, 1, 1] <- theta  #weight theta for conf (1,1,1), weight 0 for all others
##D # c) Define Thresholds
##D thresholds <- list()
##D thresholds[[1]] <- c(0, 0)
##D thresholds[[2]] <- c(0, 0)
##D thresholds[[3]] <- c(0, 0)
##D 
##D 
##D # 2) Sample from Graph
##D iter <- 1
##D set.seed(iter)
##D N <- 2000
##D d_iter <- mgmsampler(factors = factors,
##D                      interactions = interactions,
##D                      thresholds = thresholds,
##D                      type = type,
##D                      level = level,
##D                      N = N,
##D                      nIter = 50,
##D                      pbar = TRUE)
##D 
##D 
##D # 3.1) Estimate order 3 MGM usind standard parameterization
##D d_est_stand <- mgm(data = d_iter$data,
##D                    type = type,
##D                    level = level,
##D                    k = 3,
##D                    lambdaSel = "CV",
##D                    ruleReg = "AND",
##D                    pbar = TRUE, 
##D                    overparameterize = FALSE, 
##D                    signInfo = FALSE)
##D 
##D # We look at the nodewise regression for node 1 (same for all)
##D coefs_stand <- d_est_stand$nodemodels[[1]]$model
##D coefs_stand 
##D # We see that nonzero-zero pattern of parameter vector does not allow us to infer whether 
##D # interactions are present or not
##D 
##D 
##D # 3.2) Estimate order 3 MGM usind overparameterization
##D d_est_over <- mgm(data = d_iter$data,
##D                   type = type,
##D                   level = level,
##D                   k = 3,
##D                   lambdaSel = "CV",
##D                   ruleReg = "AND",
##D                   pbar = TRUE, 
##D                   overparameterize = TRUE, 
##D                   signInfo = FALSE)
##D 
##D # We look at the nodewise regression for node 1 (same for all)
##D coefs_over <- d_est_over$nodemodels[[1]]$model
##D coefs_over # recovers exactly the 3-way interaction
##D 
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
##D 
##D 
##D 
## End(Not run)





