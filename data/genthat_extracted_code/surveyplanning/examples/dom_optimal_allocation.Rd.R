library(surveyplanning)


### Name: dom_optimal_allocation
### Title: Optimal sample size allocation
### Aliases: dom_optimal_allocation
### Keywords: surveyplanning

### ** Examples


data(ses)

data <- data.table(ses)
data[, H := paste(location, NACE1, size, sep = "_")]
data[, id := .I]
data[, full := 0]
data[, sup_cv := 10]
data[, sup_w := 20]
#vars <- dom_optimal_allocation(id = "id", dom = "sex",
#                                H = "H", Y = "earnings",
#                                indicator = "full", 
#                                sup_w = "sup_w",
#                                sup_cv = "sup_cv",
#                                min_size = 3,
#                                correction_before = FALSE,
#                                dataset = data)
#                                dataset=data)
#vars



