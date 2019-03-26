## ----custom, echo = FALSE, results ='hide', message = FALSE, warning = FALSE----
set.seed(5)
library('knitr')

## ------------------------------------------------------------------------
library('TBFmultinomial')
data("VAP_data")
dim(VAP_data)
head(VAP_data, 10)
table(VAP_data$outcome)

## ------------------------------------------------------------------------
full <- outcome ~ ns(day, df = 4) +
  gender + type + SAPSadmission + SOFA
class(full)

## ------------------------------------------------------------------------
PMP_LEB_flat <- PMP(fullModel = full, data = VAP_data,
                    discreteSurv = TRUE)

## ------------------------------------------------------------------------
class(PMP_LEB_flat)
as.data.frame(PMP_LEB_flat)

## ------------------------------------------------------------------------
postInclusionProb(PMP_LEB_flat)

## ------------------------------------------------------------------------
# we first fit the model:
model_full_nnet <- multinom(formula = full, data = VAP_data,
                            maxit = 150, trace = FALSE)
# retrieve the g estimate of the full model
g_est <-  tail(PMP_LEB_flat$G, 1)
# and then apply the function
test_CSVS_nnet <- CSVS(g = g_est, model = model_full_nnet,
                       discreteSurv = TRUE, package = 'nnet')


## ----CSVS1, fig.keep='last', fig.align='center', fig.cap = 'Absolute values of the shrunken standardized coefficients before and after CSVS.'----
res <- plot_CSVS(CSVSobject = test_CSVS_nnet,
                 namesVar = NULL, shrunken = TRUE,
                 standardized = TRUE, numberIntercepts = 5)

## ------------------------------------------------------------------------
pips_landmark <-
  PIPs_by_landmarking(fullModel = full, data = VAP_data,
                      discreteSurv = TRUE, numberCores = 1,
                      landmarkLength = 4, lastlandmark = 20,
                      timeVariableName = 'day')

## ----PIPs_landmark, fig.keep='last', fig.align='center', fig.cap = 'The posterior inclusion probabilities for each landmark.'----
pips_matrix <- matrix(unlist(pips_landmark),
                      nrow = length(pips_landmark),
                      byrow = TRUE)
colnames(pips_matrix) <- names(pips_landmark[[1]])
par(mfrow = c(2,2), las = 1)
for(i in 1:ncol(pips_matrix)){
  plot(seq(0, 20, by = 4), pips_matrix[ , i], type = 'b',
       xlab = 'Landmark (in days)', pch = 19,
       ylab = 'Probability',
       main = colnames(pips_matrix)[i],
       ylim = c(0, 1))
  abline(h = .5, col = 'blue', lty = 2)
}

