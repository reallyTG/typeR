library(REAT)


### Name: gifpro
### Title: Commercial area prognosis
### Aliases: gifpro

### ** Examples

# Data for the city Kempten (2012):
emp2012 <- c(7228, 12452, 11589)
sharesCA <- c(100, 40, 10)
rsquote <- c(0.3, 0.3, 0.3)
rlquote <- c(0.7, 0.7, 0.7)
arealindex <- c(148, 148, 148)
industries <- c("Manufacturing", "Wholesale and retail trade, Transportation 
and storage, Information and communication", "Other services")

gifpro (e_ij = emp2012, a_i = sharesCA,  sq_ij = rsquote,
rq_ij = rlquote, ai_ij = arealindex, time.base = 2012, 
tinterval = 13, industry.names = industries, output = "short")
# short output

gifpro (e_ij = emp2012, a_i = sharesCA,  sq_ij = rsquote,
rq_ij = rlquote, ai_ij = arealindex, time.base = 2012, 
tinterval = 13, industry.names = industries, output = "full")
# full output

gifpro_results <- gifpro (e_ij = emp2012, a_i = sharesCA,  sq_ij = rsquote,
rq_ij = rlquote, ai_ij = arealindex, time.base = 2012, 
tinterval = 13, industry.names = industries, output = "short")
# saving results as gifpro object

gifpro_results$components
# single components

gifpro_results$results
# results (as shown in full output)



