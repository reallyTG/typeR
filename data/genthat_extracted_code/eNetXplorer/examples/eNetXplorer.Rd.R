library(eNetXplorer)


### Name: eNetXplorer
### Title: generates family of elastic net models for different alphas
### Aliases: eNetXplorer

### ** Examples

## Don't show: 
set.seed(123)
fit = eNetXplorer(x=matrix(rnorm(75),ncol=3),y=rnorm(25),family="gaussian",
n_run=5,n_perm_null=4,alpha=c(0.5,1))
## End(Don't show)
## No test: 
# Linear models (synthetic dataset comprised of 20 features and 75 instances):
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor, y=QuickStartEx$response,
family="gaussian", n_run=20, n_perm_null=10, seed=111)
## End(No test)
## No test: 
# Linear models to predict numerical day-70 H1N1 serum titers based on 
# day-7 cell population frequencies:
data(H1N1_Flow)
fit = eNetXplorer(x=H1N1_Flow$predictor_day7, y=H1N1_Flow$response_numer[rownames(
H1N1_Flow$predictor_day7)], family="gaussian", n_run=25, n_perm_null=15, seed=111)
## End(No test)
## No test: 
# Binomial models to predict acute myeloid (AML) vs acute lymphoblastic (ALL) 
# leukemias: 
data(Leukemia_miR)
fit = eNetXplorer(x=Leukemia_miR$predictor, y=Leukemia_miR$response_binomial, 
family="binomial", n_run=25, n_perm_null=15, seed=111)
## End(No test)
## No test: 
# Multinomial models to predict acute myeloid (AML), acute B-cell lymphoblastic 
# (B-ALL) and acute T-cell lymphoblastic (T-ALL) leukemias:
data(Leukemia_miR)
fit = eNetXplorer(x=Leukemia_miR$predictor, y=Leukemia_miR$response_multinomial,
family="multinomial", n_run=25, n_perm_null=15, seed=111)
## End(No test)
## No test: 
# Binomial models to predict B-ALL vs T-ALL:
data(Leukemia_miR)
fit = eNetXplorer(x=Leukemia_miR$predictor[Leukemia_miR$response_multinomial!="AML",],
y=Leukemia_miR$response_multinomial[Leukemia_miR$response_multinomial!="AML"], 
family="binomial", n_run=25, n_perm_null=15, seed=111)
## End(No test)



