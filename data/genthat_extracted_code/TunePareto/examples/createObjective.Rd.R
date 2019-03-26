library(TunePareto)


### Name: createObjective
### Title: Create a new objective function
### Aliases: createObjective
### Keywords: objective function multi-objective optimization MOO

### ** Examples


# create new objective minimizing the number of support vectors
# for a support vector machine

reclassSupportVectors <- function (saveModel = FALSE) 
{
    createObjective(precalculationFunction = reclassification, 
        precalculationParams = NULL, objectiveFunction = 
        function(result, saveModel) 
        {
	        if(result$model$classifier$name != "svm")
		        stop("This objective function can only be applied 
		              to classifiers of type tunePareto.svm()")

      		res <- result$model$model$tot.nSV

		      if (saveModel) 
		      # return a list containing the objective value as well as the model
		      {
		         return(list(additionalData = result$model, fitness = res))
		      }
		      else 
		      # only return the objective value
		        return(res)
        }, 
        objectiveFunctionParams = list(saveModel = saveModel), 
        direction = "minimize", 
        name = "Reclass.SupportVectors")
}

# tune error vs. number of support vectors on the 'iris' data set
r <- tunePareto(data = iris[, -ncol(iris)], 
                labels = iris[, ncol(iris)],
                classifier = tunePareto.svm(),
                cost=c(0.001,0.005,0.01,0.05,0.1,0.5,1,5,10,50),
                objectiveFunctions=list(reclassError(), reclassSupportVectors()))

print(r)



