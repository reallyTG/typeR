library(lsr)


### Name: correlate
### Title: Correlation matrices
### Aliases: correlate

### ** Examples
# data frame with factors and missing values
data <- data.frame( 
  anxiety = c(1.31,2.72,3.18,4.21,5.55,NA), 
  stress = c(2.01,3.45,1.99,3.25,4.27,6.80), 
  depression = c(2.51,1.77,3.34,5.83,9.01,7.74),
  happiness = c(4.02,3.66,5.23,6.37,7.83,1.18),
  gender = factor( c("male","female","female","male","female","female") ),
  ssri = factor( c("no","no","no",NA,"yes","yes") )
)

# default output is just the (Pearson) correlation matrix
correlate( data )

# other types of correlation:
correlate( data, corr.method="spearman" )

# two meaningful subsets to be correlated:
nervous <- data[,c("anxiety","stress")]
happy <- data[,c("happiness","depression","ssri")] 

# default output for two matrix input
correlate( nervous, happy )

# the same examples, with Holm-corrected p-values
correlate( data, test=TRUE ) 
correlate( nervous, happy, test=TRUE )



