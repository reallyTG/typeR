library(PCRedux)


### Name: performeR
### Title: Performance analysis for binary classification
### Aliases: performeR
### Keywords: accuracy precision sensitivity specificity

### ** Examples

# Produce some arbitrary binary decisions data
# test_data is the new test or method that should be analyzed
# reference_data is the reference data set that should be analyzed
test_data <- c(0,0,0,0,0,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1)
reference_data <- c(0,0,0,0,1,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1)

# Plot the data of the decisions
plot(1:length(test_data), test_data, xlab="Sample", ylab="Decisions",
     yaxt="n", pch=19)
axis(2, at=c(0,1), labels=c("negative", "positive"), las=2)
points(1:length(reference_data), reference_data, pch=1, cex=2, col="blue")
legend("topleft", c("Sample", "Reference"), pch=c(19,1),
        cex=c(1.5,1.5), bty="n", col=c("black","blue"))

# Do the statistical analysis with the performeR function
performeR(sample=test_data, reference=reference_data)



