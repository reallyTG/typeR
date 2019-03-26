library(discretecdAlgorithm)


### Name: generate_discrete_data
### Title: generate_discrete_data
### Aliases: generate_discrete_data

### ** Examples


### generate observational data
gr <- sparsebnUtils::random.graph(5, 5) # use sparsebnUtils package to generate a random graph
names(gr) = c("V1", "V2", "V3", "V4", "V5")
nlevels <- c(3, 5, 2, 2, 3)
gr.params <- coef_gen(edge_list = gr, n_levels = nlevels)
data.obs <- discretecdAlgorithm::generate_discrete_data(graph = gr,
                                                        n = 100,
                                                        n_levels = nlevels,
                                                        params = gr.params)

### generate experimental data
ivn <- as.list(c(rep("V1", 50), rep("V2", 50))) # 50 interventions on V1, 50 interventions on V2
data.ivn <- discretecdAlgorithm::generate_discrete_data(graph = gr,
                                             n = 100,
                                             n_levels = nlevels,
                                             params = gr.params,
                                             ivn = ivn)

###  Use pre-specified values for interventions
###  In this toy example, we assume that all intervened nodes were fixed to
###  to the value 1, although this can be any number of course.
ivn.vals <- lapply(ivn, function(x) sapply(x, function(x) 1)) # replace all entries with a 1
data.ivn <- discretecdAlgorithm::generate_discrete_data(graph = gr,
                                             n = 100,
                                             n_levels = nlevels,
                                             params = gr.params,
                                             ivn = ivn.vals,
                                             ivn.rand = FALSE)




