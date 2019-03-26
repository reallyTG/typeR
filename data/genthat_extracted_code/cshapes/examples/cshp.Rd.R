library(cshapes)


### Name: cshp
### Title: Access the CShapes dataset in R
### Aliases: cshp

### ** Examples

# Retrieve the dataset
cshp.data <- cshp()

# Get summary statistics
summary(cshp.data)

# Extract Switzerland 
switzerland <- cshp.data[cshp.data$COWCODE==225,]

# Plot Switzerland
plot(switzerland)

# Extract a snapshot of cshapes as of June 30, 2002
# using the Gleditsch&Ward coding system
cshp.2002 <- cshp(date=as.Date("2002-6-30"), useGW=TRUE)



