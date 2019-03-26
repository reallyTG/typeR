library(vardpoor)


### Name: vardom
### Title: Variance estimation of the sample surveys in domain by the
###   ultimate cluster method
### Aliases: vardom
### Keywords: vardpoor

### ** Examples

data(eusilc)
dataset <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

aa <- vardom(Y = "eqIncome", H = "db040", PSU = "db030",
           w_final = "rb050", id = "rb030", Dom = "db040",
           period = NULL, N_h = NULL, Z = NULL,
           X = NULL, g = NULL, q = NULL, dataset = dataset,
           confidence = .95, percentratio = 100, 
           outp_lin = TRUE, outp_res = TRUE)



