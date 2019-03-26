library(ccdrAlgorithm)


### Name: generate_mvn_data
### Title: Generate data from a DAG
### Aliases: generate_mvn_data

### ** Examples


### Generate observational data
gr <- sparsebnUtils::random.graph(5, 5) # use sparsebnUtils package to generate a random graph
gr.params <- runif(10) # there are 5 coefficients + 5 variances
data.obs <- ccdrAlgorithm::generate_mvn_data(graph = gr,
                                             n = 100,
                                             params = gr.params)

### Generate experimental data
ivn <- as.list(c(rep("V1", 50), rep("V2", 50))) # 50 interventions on V1, 50 interventions on V2
data.ivn <- ccdrAlgorithm::generate_mvn_data(graph = gr,
                                             n = 100,
                                             params = gr.params,
                                             ivn = ivn)

### Use pre-specified values for interventions
###  In this toy example, we assume that all intervened nodes were fixed to
###  to the value 1, although this can be any number of course.
ivn.vals <- lapply(ivn, function(x) sapply(x, function(x) 1)) # replace all entries with a 1
data.ivn <- ccdrAlgorithm::generate_mvn_data(graph = gr,
                                             n = 100,
                                             params = gr.params,
                                             ivn = ivn.vals,
                                             ivn.rand = FALSE)

### If ivn.rand = FALSE, you must specify values
###  The code below will fail because ivn does not contain any values
### (compare to ivn.vals above).
## Not run: 
##D data.ivn <- ccdrAlgorithm::generate_mvn_data(graph = gr,
##D                                              n = 100,
##D                                              params = gr.params,
##D                                              ivn = ivn,
##D                                              ivn.rand = FALSE)
## End(Not run)




