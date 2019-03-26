library(surveyplanning)


### Name: prop_dom_optimal_allocation
### Title: Optimal sample size allocation for proportion
### Aliases: prop_dom_optimal_allocation
### Keywords: surveyplanning

### ** Examples


data(eusilc)
eusilc <- data.table(eusilc)
data <- eusilc[, .(poph = sum(db090)), by = c("db040")]
data[, dom := "1"]
res <- prop_dom_optimal_allocation(H = "db040", Dom = "dom",
                                   pop = "poph", R = NULL, 
                                   deff = NULL, se_max = 0.5,
                                   prop = 0.5, min_size = 3,
                                   step = 1, unit_level = FALSE,
                                   dataset = data)



