library(clr)


### Name: clr
### Title: Curve Linear Regression via dimension reduction
### Aliases: clr

### ** Examples

library(clr)
data(gb_load)
data(clust_train)

clr_load <- clrdata(x = gb_load$ENGLAND_WALES_DEMAND,
                    order_by = gb_load$TIMESTAMP,
                    support_grid = 1:48)

## data cleaning: replace zeros with NA
clr_load[rowSums((clr_load == 0) * 1) > 0, ] <- NA
matplot(t(clr_load), ylab = 'Daily loads', type = 'l')

Y <- clr_load[2:nrow(clr_load), ]
X <- clr_load[1:(nrow(clr_load) - 1), ]

begin_pred <- which(substr(rownames(Y), 1, 4) == '2016')[1]
Y_train <- Y[1:(begin_pred - 1), ]
X_train <- X[1:(begin_pred - 1), ]

## Example without any cluster
model <- clr(Y = Y_train, X = X_train)

## Example with clusters
model <- clr(Y = Y_train, X = X_train, clust = clust_train)



