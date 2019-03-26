library(p2distance)


### Name: p2distance
### Title: Welfare's Synthetic Indicator function
### Aliases: p2distance
### Keywords: p2distance synthetic indicators

### ** Examples

## Calculate a welfare indicator for 27 countries of Europe 
data(welfare) 

## Convert welfare dataframe to matrix object 
welfare <- as.matrix(welfare)

## Calculate P2 Distance 
ind <- p2distance(matriz=welfare, reference_vector_function = min, 
        iterations = 20)

## Examine the results
# P2 distance
ind$p2distance

# Iterations to achieve convergence
ind$iteration 

# Order of entry of variables resulting the last iteration
ind$variables_sort

# Correction factors of each variable
ind$correction_factors

# Correlations between P2 distance indicator and variables
ind$cor.coeff

# Discrimination coefficient of each variable
ind$discrimination.coefficient

## Plot of P2 Distance Indicator for European countries
barplot(ind$p2distance, beside=TRUE, col="white", space=.3, ylab="P2 distance", 
      ylim=c(0,20), names.arg=rownames(ind$p2distance), las=3, cex.names=0.8)



