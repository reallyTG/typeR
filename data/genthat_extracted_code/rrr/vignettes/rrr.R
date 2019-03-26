## ------------------------------------------------------------------------
library(rrr)

## ------------------------------------------------------------------------
library(dplyr)
data(tobacco)

tobacco <- as_data_frame(tobacco)

glimpse(tobacco)

## ------------------------------------------------------------------------
tobacco_x <- tobacco %>%
	select(starts_with("X"))

tobacco_y <- tobacco %>% 
	select(starts_with("Y"))

## ------------------------------------------------------------------------
GGally::ggcorr(tobacco_x)

## ------------------------------------------------------------------------
GGally::ggcorr(tobacco_y)

## ------------------------------------------------------------------------
## multivariate regression

x <- as.matrix(tobacco_x)
y <- as.matrix(tobacco_y)

multivar_reg <- t(cov(y, x) %*% solve(cov(x)))

## separate multiple regression

lm1 <- lm(y[,1] ~ x)$coeff
lm2 <- lm(y[,2] ~ x)$coeff
lm3 <- lm(y[,3] ~ x)$coeff

## ------------------------------------------------------------------------
multivar_reg
cbind(lm1, lm2, lm3)

## ------------------------------------------------------------------------
args(rank_trace)

## ------------------------------------------------------------------------
### use the identity matrix for gamma

rank_trace(tobacco_x, tobacco_y) 

## ------------------------------------------------------------------------
rank_trace(tobacco_x, tobacco_y, plot = FALSE)

## ------------------------------------------------------------------------
### use inverse of estimated covariance of Y for gamma

rank_trace(tobacco_x, tobacco_y, type = "cva")

## ------------------------------------------------------------------------
#rank_trace(tobacco_x, tobacco_y, type = "cva", plot = FALSE)

## ------------------------------------------------------------------------
args(rrr)

## ------------------------------------------------------------------------
rrr(tobacco_x, tobacco_y, rank = "full") 

## ------------------------------------------------------------------------
args(residuals)

## ------------------------------------------------------------------------
residuals(tobacco_x, tobacco_y, rank = 1, plot = FALSE)

## ------------------------------------------------------------------------
residuals(tobacco_x, tobacco_y, rank = 1)

## ------------------------------------------------------------------------
residuals(tobacco_x, tobacco_y, rank = 1, plot = FALSE)

## ----message = FALSE, warning = FALSE------------------------------------
data(pendigits)
digits <- as_data_frame(pendigits) %>% select(-V36)

glimpse(digits)

## ------------------------------------------------------------------------
digits_features <- digits %>% select(-V35)
digits_class <- digits %>% select(V35)

## ------------------------------------------------------------------------
GGally::ggcorr(digits_features)

## ------------------------------------------------------------------------
rrr(digits_features, digits_features, type = "pca")$goodness_of_fit

## ------------------------------------------------------------------------
rank_trace(digits_features, digits_features, type = "pca")

## ------------------------------------------------------------------------
rank_trace(digits_features, digits_features, type = "pca", plot = FALSE)

## ------------------------------------------------------------------------
args(pairwise_plot)

## ------------------------------------------------------------------------
pairwise_plot(digits_features, digits_class, type = "pca")

## ------------------------------------------------------------------------
pairwise_plot(digits_features, digits_class, type = "pca", pair_x = 1, pair_y = 3)

## ------------------------------------------------------------------------
#args(pca_allpairs_plot)

## ------------------------------------------------------------------------
#pca_allpairs_plot(digits_features, rank = 3, class_labels = digits_class)

## ------------------------------------------------------------------------
rrr(digits_features, digits_features, type = "pca", rank  = 3)

## ------------------------------------------------------------------------
### COMBO-17 galaxy data
data(COMBO17)
galaxy <- as_data_frame(COMBO17) %>%
       select(-starts_with("e."), -Nr, -UFS:-IFD) %>%
       na.omit()

glimpse(galaxy)

## ------------------------------------------------------------------------
galaxy_x <- galaxy %>%
  select(-Rmag:-chi2red)

galaxy_y <- galaxy %>%
  select(Rmag:chi2red)

## ------------------------------------------------------------------------
GGally::ggcorr(galaxy_x)

## ------------------------------------------------------------------------
GGally::ggcorr(galaxy_y)

## ------------------------------------------------------------------------
rank_trace(galaxy_x, galaxy_y, type = "cva")

## ------------------------------------------------------------------------
residuals(galaxy_x, galaxy_y, type = "cva", rank = 2, k = 0.001, plot = FALSE)

## ------------------------------------------------------------------------
residuals(galaxy_x, galaxy_y, type = "cva", rank = 2, k = 0.001)

## ------------------------------------------------------------------------
pairwise_plot(galaxy_x, galaxy_y, type = "cva", pair_x = 1, k = 0.0001)
pairwise_plot(galaxy_x, galaxy_y, type = "cva", pair_x = 2, k = 0.0001)

## ------------------------------------------------------------------------
pairwise_plot(galaxy_x, galaxy_y, type = "cva", pair_x = 3)
pairwise_plot(galaxy_x, galaxy_y, type = "cva", pair_x = 6)

## ------------------------------------------------------------------------
rrr(galaxy_x, galaxy_y, type = "cva", rank = 2, k = 0.0001)

## ------------------------------------------------------------------------
data(iris)
iris <- as_data_frame(iris)

glimpse(iris)

## ------------------------------------------------------------------------
iris_features <- iris %>%
  select(-Species)

iris_class <- iris %>%
  select(Species)

## ------------------------------------------------------------------------
pairwise_plot(iris_features, iris_class, type = "lda", k = 0.0001)

## ------------------------------------------------------------------------
rrr(iris_features, iris_class, type = "lda", k = 0.0001)

## ------------------------------------------------------------------------
scores(iris_features, iris_class, type = "lda", k = 0.0001)

