library(cabootcrs)


### Name: cabootcrs-package
### Title: Bootstrap Confidence Regions for Correspondence Analysis
### Aliases: cabootcrs-package
### Keywords: package correspondence analysis confidence ellipse resampling

### ** Examples

# Data frame, with row and column labels, from file

data(DreamData)

# Matrix with no labels

dreamdata <- t(matrix(c(7,4,3,7,10,15,11,13,23,9,11,7,28,9,12,10,32,5,4,3),4,5))

# Calculate variances and produce confidence ellipses for the Dream data set, 
# with labels taken from those in the data file and default symbols and colours. 
# Use all defaults: 1000 bootstraps, Poisson resampling, calculate variances 
# only for first two axes, but give usual output for up to the first 4 axes. 
# Show one biplot with confidence ellipses for row points in principal coordinates,
# another biplot with confidence ellipses for column points in principal coordinates.
# In each case the other set of points are in standard coordinates, but note that the 
# lines are cropped to fit the plot by default, as it is the directions that matter most. 

bd <- cabootcrs(DreamData)

# Same thing, but input data matrix rather than read from file,
# rows and columns by default just labelled by their number.

## Not run: 
##D bd2 <- cabootcrs(dreamdata)
##D 
##D # Plot in "french" style where both rows and columns are in principal coordinates, 
##D # not as a biplot, but still produce two plots, with row ellipses in one plot 
##D # and column ellipses in the other. 
##D 
##D plotca(bd, plottype="french")
##D 
##D # Calculate variances and covariances for axes 1-3, though only plots axis 1 versus 2. 
##D # Then plot axis 1 against axis 3.
##D 
##D bd3 <- cabootcrs(DreamData, lastaxis=3)
##D plotca(bd3, firstaxis=1, lastaxis=3)
##D 
##D # See the stored results, an object of type cabootcrsresults.
##D 
##D bd
## End(Not run)

# Prettier printed output, no plots.  

printca(bd)

# Brief summary output, similar style to ca package, no plots.  

summaryca(bd,datasetname="Dreams")

# Extract the covariance matrix of: 
# row 4 for axes 1 and 2; 
# column 1 for axes 1 and 2.

vmr4 <- covmat(bd,4,"row",1,2)
vmc1 <- covmat(bd,1,"column",1,2)

# Display all variances and covariances for each row and column, axes 1-2.

allvarscovs(bd, "rows")
allvarscovs(bd, "columns")




