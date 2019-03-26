## ------------------------------------------------------------------------
library(IMTest)
library(lme4)
library(reshape2)

## ------------------------------------------------------------------------

data(VerbAgg)

x = dcast(VerbAgg[,c( "id","item", "resp")], id~item)

for(i in 2:25){
  x[,i] = factor(x[,i], levels = c("no", "perhaps", "yes"))
}

my_data = x[,2:13]

J = dim(my_data)[[2]]
n = dim(my_data)[[1]]

## ------------------------------------------------------------------------

# Create index vectors
ind = list()
for(i in 1:J){
  ind[[i]] = rep(0, J*2)
  ind[[i]][(2*i-1):(2*i)] = 1
}

## ------------------------------------------------------------------------
col = split(rep(c(1:3), J), rep(1:J, each = 3))
temp_data = collapse_data(my_data, col, "rasch")
mod = gpcm_IMT(temp_data$data, constraint = "rasch")

## Creates a matrix to store results.
pval = matrix(c(0), nrow = J, ncol = 3)


## ---- results = "hide"---------------------------------------------------
# No Collapsing
for(i in 1:J){
  test_fit = IMT(mod, "rasch", R = 5000, ind[[i]])
  pval[i,1] = pchisq(test_fit$Tstat, test_fit$df, lower.tail = F)
}

# Collapsing the middle categoy up.
for(i in 1:J){
  col = split(rep(c(1:3), J), rep(1:J, each = 3))
  col[[i]] = c(1,2,2)
  temp_data = collapse_data(my_data, col, "rasch")
  mod = gpcm_IMT(temp_data$data, constraint = "rasch")
  test_fit = IMT(mod, "rasch", R = 5000, temp_data$ind)
  pval[i,2] = pchisq(test_fit$Tstat, test_fit$df, lower.tail = F)
}

# Collapsing the middle category down.
for(i in 1:J){
  col = split(rep(c(1:3), J), rep(1:J, each = 3))
  col[[i]] = c(1,1,2)
  temp_data = collapse_data(my_data, col, "rasch")
  mod = gpcm_IMT(temp_data$data, constraint = "rasch")
  test_fit = IMT(mod, "rasch", R = 5000, temp_data$ind)
  pval[i,3] = pchisq(test_fit$Tstat, test_fit$df, lower.tail = F)
}

## ------------------------------------------------------------------------
# Original fit: all but question 8 fail to reject goodness-of-fit.
p.adjust(pval[,1], method = "fdr")

# After collapsing: question 8 now fails to reject goodness-of-fit, but 4 other questions reject.
p.adjust(pval[,2], method = "fdr")

# Had it been collapsed the other direction, all would fail to reject.
p.adjust(pval[,3], method = "fdr")


