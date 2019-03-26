library(lslx)


### Name: lslx
### Title: R6 class for semi-confirmatory structural equation modeling via
###   penalized likelihood
### Aliases: lslx

### ** Examples

## EXAMPLE: Regression Analysis with Lasso Penalty ##
# run `vignette("regression-analysis")` to see the vignette
# generate data for regression analysis
set.seed(9487)
x <- matrix(rnorm(2000), 200, 10)
colnames(x) <- paste0("x", 1:10)
y <- matrix(rnorm(200), 200, 1)
data_reg <- data.frame(y, x)

# specify regression model with penalized coefficients
model_reg <- "y <= x1 + x2 + x3 + x4
              y <~ x5 + x6 + x7 + x8 + x9 + x10"

# initialize lslx object via specified model and raw data
lslx_reg <- lslx$new(model = model_reg, 
                     data = data_reg)

# fit specified model to data with lasso under specified penalty levels
lslx_reg$fit(penalty_method = "lasso",
             lambda_grid = seq(.00, .30, .01))

# summarize fitting result under penalty level selected by 'aic'
lslx_reg$summarize(selector = "aic")


## EXAMPLE: Semi-Confirmatory Factor Analysis ##
# run `vignette("factor-analysis")` to see the vignette
# specify semi-confirmatory factor analysis model
model_fa <- "visual  :=> x1 + x2 + x3
             textual :=> x4 + x5 + x6
             speed   :=> x7 + x8 + x9
             visual  :~> x4 + x5 + x6 + x7 + x8 + x9
             textual :~> x1 + x2 + x3 + x7 + x8 + x9
             speed   :~> x1 + x2 + x3 + x4 + x5 + x6
             visual  <=> fix(1) * visual
             textual <=> fix(1) * textual
             speed   <=> fix(1) * speed"
          
# initialize lslx object via specified model and raw data
lslx_fa <- lslx$new(model = model_fa,
                    data = lavaan::HolzingerSwineford1939)
                    
# fit with mcp under specified penalty levels and convexity levels
lslx_fa$fit(penalty_method = "mcp", 
            lambda_grid = seq(.02, .60, .02), 
            delta_grid = c(1.5, 3.0, Inf))

# summarize fitting result under penalty level selected by 'bic'
lslx_fa$summarize(selector = "bic")


## EXAMPLE: Semi-Confirmatory Structural Equation Modeling ##
# run `vignette("structural-equation-modeling")` to see the vignette
# specify structural equation modeling model
model_sem <- "fix(1) * x1 + x2 + x3   <=: ind60
              fix(1) * y1 + y2 + y3 + y4 <=: dem60
              fix(1) * y5 + y6 + y7 + y8 <=: dem65
              dem60 <= ind60
              dem65 <= ind60 + dem60"

# initialize lslx object via specified model and sample moments
lslx_sem <- lslx$new(model = model_sem,
                     sample_cov = cov(lavaan::PoliticalDemocracy),
                     sample_size = nrow(lavaan::PoliticalDemocracy))

# set some covariances of errors as penalized 
lslx_sem$penalize_coefficient(name = c("y1<->y5",
                                       "y2<->y4",
                                       "y2<->y6",
                                       "y3<->y7",
                                       "y4<->y8",
                                       "y6<->y8"))

# fit with lasso under default penalty levels
lslx_sem$fit_lasso(lambda_length = 25)

# summarize fitting result under penalty level selected by 'abic'
lslx_sem$summarize(selector = "abic")


## EXAMPLE: Factor Analysis with Missing Data ##
# run `vignette("missing-data-analysis")` to see the vignette
# create missing values for x5 and x9 by the code in package semTools
data_miss <- lavaan::HolzingerSwineford1939
data_miss$x5 <- ifelse(data_miss$x1 <= quantile(data_miss$x1, .3), 
                       NA, data_miss$x5)
data_miss$age <- data_miss$ageyr + data_miss$agemo/12
data_miss$x9 <- ifelse(data_miss$age <= quantile(data_miss$age, .3), 
                       NA, data_miss$x9)

# specify confirmatory factor analysis model
model_miss <- "visual  :=> x1 + x2 + x3 
               textual :=> x4 + x5 + x6
               speed   :=> x7 + x8 + x9
               visual  <=> 1 * visual
               textual <=> 1 * textual
               speed   <=> 1 * speed"

# "ageyr" and "agemo" are set as auxiliary variables
lslx_miss <- lslx$new(model = model_miss,
                      data = data_miss,
                      auxiliary_variable = c("ageyr", "agemo"))
                      
# penalize all covariances among residuals
lslx_miss$penalize_block(block = "y<->y", 
                         type = "fixed",
                         verbose = FALSE)

# fit with lasso under default penalty levels
lslx_miss$fit_lasso(lambda_length = 25)

# summarize fitting result under penalty level selected by 'raic'
lslx_miss$summarize(selector = "raic")


## EXAMPLE: Multi-Group Factor Analysis ##
# run `vignette("multi-group-analysis")` to see the vignette
# specify multi-group factor analysis model
model_mgfa <- "visual  :=> 1 * x1 + x2 + x3
               textual :=> 1 * x4 + x5 + x6
               speed   :=> 1 * x7 + x8 + x9"

# "school" is set as group variable and "Pasteur" is specified as reference
lslx_mgfa <- lslx$new(model = model_mgfa,
                      data = lavaan::HolzingerSwineford1939,
                      group_variable = "school",
                      reference_group = "Pasteur")

# penalize increment components of loadings and intercepts in 'Grant-White'
lslx_mgfa$penalize_heterogeneity(block = c("y<-1", "y<-f"), 
                                 group = "Grant-White")

# free increment components of means of latent factors in 'Grant-White'
lslx_mgfa$free_block(block = "f<-1", 
                     group = "Grant-White")
                     
# fit with mcp under default penalty levels and specified convexity levels
lslx_mgfa$fit_mcp(lambda_length = 25)

# summarize fitting result under penalty level selected by 'hbic'
lslx_mgfa$summarize(selector = "hbic")




