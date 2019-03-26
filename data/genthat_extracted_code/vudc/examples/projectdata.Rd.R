library(vudc)


### Name: projectdata
### Title: Commit and Maintainability Data
### Aliases: projectdata
### Keywords: datasets

### ** Examples

# Initialization.
library(vudc)
data(projectdata)

#
# Helper functions.
# These are necessary for the drawing and test execution functions.
#

# Frame for drawing four diagrams.
drawFourDiagrams <- function(diagram) {
	op <- par(mfrow = c(2,2))
	performOperationAllProjects(diagram)
	par(op)
}

# Frame for executing an operation on all the available project data.
performOperationAllProjects <- function(operation) {
	for (projectName in c("Ant", "Gremon", "Struts2", "Tomcat")) {
		operation(projectName)
	}
}

# Helper functions for getFourDivisions and categorizeProjectData.

commitCategoryD <- function(actualProjectData) {
	actualProjectData$D > 0
}

commitCategoryA <- function(actualProjectData) {
	actualProjectData$D == 0 & actualProjectData$A > 0
}

commitCategoryUplus <- function(actualProjectData) {
	actualProjectData$D == 0 & actualProjectData$A == 0 & actualProjectData$U >= 2
}

commitCategoryU1 <- function(actualProjectData) {
	actualProjectData$D == 0 & actualProjectData$A == 0 & actualProjectData$U == 1
}


# Divides the maintainability difference values into four, based on the related operations.
getFourDivisions <- function(actualProjectData) {
	return (list(
		actualProjectData$MaintainabilityDiff[commitCategoryD(actualProjectData)],
		actualProjectData$MaintainabilityDiff[commitCategoryA(actualProjectData)], 
		actualProjectData$MaintainabilityDiff[commitCategoryUplus(actualProjectData)], 
		actualProjectData$MaintainabilityDiff[commitCategoryU1(actualProjectData)]
	))
}

# Extend project data with  operation category (opcat) 
# and maintainability change category (changecat).
categorizeProjectData <- function(projectName) {
	actualProjectData <- projectdata[[projectName]]
	
	actualProjectData$opcat[commitCategoryD(actualProjectData)] <- 'D';
	actualProjectData$opcat[commitCategoryA(actualProjectData)] <- 'A';
	actualProjectData$opcat[commitCategoryUplus(actualProjectData)] <- 'U+';
	actualProjectData$opcat[commitCategoryU1(actualProjectData)] <- 'U1';
	
	actualProjectData$changecat[actualProjectData$MaintainabilityDiff > 0] <- '+';
	actualProjectData$changecat[actualProjectData$MaintainabilityDiff == 0] <- '0';
	actualProjectData$changecat[actualProjectData$MaintainabilityDiff < 0] <- '-';
	
	actualProjectData
}

# Removed outliers from project data.
projectDataWithoutOutliers <- function(projectName) {
	projectdata[[projectName]][abs(projectdata[[projectName]]$MaintainabilityDiff) < 1000,]
}

# Maintainability change values of commits containing file addition.
maintainabilityDiffsContainingAdd <- function(actualProjectData) {
	actualProjectData$MaintainabilityDiff[actualProjectData$A > 0]
}

# Maintainability change values of commits not containing file addition.
maintainabilityDiffsWithoutAdd <- function(actualProjectData) {
	actualProjectData$MaintainabilityDiff[actualProjectData$A == 0]
}



#
# Diagram drawing and test execution functions.
# These can be executed independent from each other.
#

# Box plots illustrating maintainability change values.
# This is the motivating example for creating ccdplot.
drawFourDiagrams(
	function(projectName) {
		boxplot(
			getFourDivisions(projectdata[[projectName]]),
			main = projectName,
			names = c("D", "A", "U+", "U1")
		)
	}
)

# Box plots illustrating maintainability change values, without outliers.
drawFourDiagrams(
	function(projectName) {
		boxplot(
			getFourDivisions(projectDataWithoutOutliers(projectName)),
			main = projectName,
			names = c("D", "A", "U+", "U1")
		)
	}
)

# Composite cumulative characteristic diagrams illustrating maintainability change values,
# including outliers.
drawFourDiagrams(
	function(projectName) {
		ccdplot(
			getFourDivisions(projectdata[[projectName]]), 
			main = projectName,
			sub = "D, A, U+, U1", 
			xlab = "Revisions", 
			ylab = "Accumulated maintainability change"
		)
	}
)

# Composite cumulative characteristic diagrams illustrating maintainability change values,
# without outliers.
drawFourDiagrams(
	function(projectName) {
		ccdplot(
			getFourDivisions(projectDataWithoutOutliers(projectName)), 
			main = projectName,
			sub = "D, A, U+, U1", 
			xlab = "Revisions", 
			ylab = "Accumulated maintainability change"
		)
	}
)

# Perform Contingency Chi Squared Test on the input data.
performOperationAllProjects (
	function(projectName) {
		projectDataCategorized <- categorizeProjectData(projectName)
		print(paste(projectName, "contingency test", sep = " - "))
		chisq.test.result <- chisq.test(table(
			projectDataCategorized$opcat, 
			projectDataCategorized$changecat)
		)
		print(chisq.test.result)
		print(paste("Exact p-value:", chisq.test.result$p.value))
	}
)

# Cumulative characteristic diagrams illustrating the maintainability change values 
# between commits containing and not containing file additions.
drawFourDiagrams(
	function(projectName) {
		actualProjectData <- projectdata[[projectName]]
		maintainabilityDiffs <- list(
			maintainabilityDiffsContainingAdd(actualProjectData),
			maintainabilityDiffsWithoutAdd(actualProjectData)
		)
		ccdplot(
			maintainabilityDiffs, 
			remove.absolute = 1000.0, 
			main = paste(projectName, "Add", sep = " - "), 
			sub = "Containing vs. not containing Add", 
			xlab = "Revisions", 
			ylab = "Accumulated maintainability change"
		)
	}
)

# Quantile difference diagrams illustrating the difference of the maintainability change values 
# between commits containing and not containing file additions.
drawFourDiagrams(
	function(projectName) {
		actualProjectData <- projectdata[[projectName]]
		qddplot(
			maintainabilityDiffsContainingAdd(actualProjectData),
			maintainabilityDiffsWithoutAdd(actualProjectData),
			main=paste(projectName, "Add", sep = " - "), 
			sub="Containing vs. not containing Add"
		)
	}
)

# Testing the difference of the maintainability change values between commits containing 
# and not containing file additions, using Wilcoxon-test.
performOperationAllProjects (
	function(projectName) {
		actualProjectData <- projectdata[[projectName]]
		print(paste(projectName, "impact of file addition", sep = " - "))
		print(wilcox.test(
			maintainabilityDiffsContainingAdd(actualProjectData),
			maintainabilityDiffsWithoutAdd(actualProjectData),
			alternative = "greater"
		))
	}
)

# Testing the ratio of the maintainability change variance between commits containing 
# and not containing file additions.
performOperationAllProjects (
	function(projectName) {
		actualProjectData <- projectDataWithoutOutliers(projectName)
		print(paste(projectName, "variance of file addition", sep = " - "))
		var.test.result <- var.test(
			maintainabilityDiffsContainingAdd(actualProjectData),
			maintainabilityDiffsWithoutAdd(actualProjectData)
		)
		print(var.test.result)
		print(paste("Exact p-value:", var.test.result$p.value))
	}
)

# Quantile difference diagrams illustrating the difference of cumulative code churn values 
# between commits of positive vs. negative maintainability change, along with related Wilcox-test.
drawFourDiagrams(
	function(projectName) {
		actualProjectData <- projectdata[[projectName]]
		churnX <- actualProjectData$Churn[actualProjectData$MaintainabilityDiff > 0]
		churnY <- actualProjectData$Churn[actualProjectData$MaintainabilityDiff < 0]
		print(paste(projectName, "cumulative code churn", sep = " - "))
		print(wilcox.test(churnX, churnY, alternative = "less"))
		qddplot(
			churnX, 
			churnY,
			main=paste(projectName, "Churn", sep = " - ")
		)
	}
)

# Quantile difference diagrams illustrating the difference of number of contributors 
# between commits of positive vs. negative maintainability change, along with related Wilcox-test.
drawFourDiagrams(
	function(projectName) {
		actualProjectData <- projectdata[[projectName]]
		ownershipX <- actualProjectData$Ownership[actualProjectData$MaintainabilityDiff > 0]
		ownershipY <- actualProjectData$Ownership[actualProjectData$MaintainabilityDiff < 0]
		print(paste(projectName, "code ownership", sep = " - "))
		print(wilcox.test(ownershipX, ownershipY, alternative = "less"))
		qddplot(
			ownershipX, 
			ownershipY,
			differences.rangemin = 0,
			main=paste(projectName, "Ownership", sep = " - ")
		)
	}
)




