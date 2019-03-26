library(MCI)


### Name: DIY1
### Title: Distance matrix for DIY stores
### Aliases: DIY1

### ** Examples

data(DIY1)
data(DIY2)
data(DIY3)
# Loading the three DIY store datasets

DIY_alldata <- merge (DIY1, DIY2, by.x = "j_destination", by.y = "j_destination")
# Add store data to distance matrix

huff_DIY <- huff.shares (DIY_alldata, "i_origin", "j_destination", "A_j_salesarea_sqm", 
"t_ij_min", gamma = 1, lambda = -2)
# Calculating Huff local market shares
# Gamma = 1, Lambda = -2

huff_DIY <- merge (huff_DIY, DIY3, by.x = "i_origin", by.y = "district")
# Add data for origins

huff_DIY_total <- shares.total (huff_DIY, "i_origin", "j_destination", "p_ij", 
"population")
# Calculating total market areas (=sums of customers)

colnames(DIY3) <- c("district", "pop")
# Change column name to "pop" (must be other name)

huff.lambda (huff_DIY, "i_origin", "j_destination", "A_j_salesarea_sqm", 
"t_ij_min", gamma = 1, atype = "pow", gamma2 = NULL,
lambda_startv = -1, lambda_endv = -2.5, dtype= "pow",
DIY3, "district", "pop", huff_DIY_total, "suppliers_single", "sum_E_j", 
method = "bisection", iterations = 10)
# Iterative search for the best lambda value using bisection
# Output: gamma and lambda

huff.lambda (huff_DIY, "i_origin", "j_destination", "A_j_salesarea_sqm", 
"t_ij_min", gamma = 1, atype = "pow", gamma2 = NULL,
lambda_startv = -1, lambda_endv = -2.5, dtype= "pow",
DIY3, "district", "pop", huff_DIY_total, "suppliers_single", "sum_E_j", 
method = "bisection", iterations = 10, output = "iterations", show_proc = TRUE)
# Same procedure, output: single iterations  

huff.lambda (huff_DIY, "i_origin", "j_destination", "A_j_salesarea_sqm", 
"t_ij_min", gamma = 1, atype = "pow", gamma2 = NULL,
lambda_startv = -1, lambda_endv = -2.5, dtype= "pow",
DIY3, "district", "pop", huff_DIY_total, "suppliers_single", "sum_E_j", 
method = "compare", iterations = 10, output = "iterations", show_proc = TRUE, plotVal = TRUE)
# Using compare method, output: single iterations and plot 



