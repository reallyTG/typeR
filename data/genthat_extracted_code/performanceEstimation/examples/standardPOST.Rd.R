library(performanceEstimation)


### Name: standardPOST
### Title: A function for applying post-processing steps to the predictions
###   of a model
### Aliases: standardPOST
### Keywords: models

### ** Examples

## Not run: 
##D 
##D ######
##D ## Using in the context of an experiment
##D 
##D 
##D data(algae,package="DMwR")
##D library(e1071)
##D 
##D ## This will issue several warnings because this implementation of SVMs
##D ## will ignore test cases with NAs in some predictor. Our infra-structure
##D ## issues a warning and fills in these with the prediction of an NA
##D res <- performanceEstimation(
##D   PredTask(a1 ~ .,algae[,1:12],"alga1"),
##D   Workflow(learner="svm"),
##D   EstimationTask(metrics="mse")
##D   )
##D summary(getIterationPreds(res,1,1,it=1))
##D 
##D ## one way of overcoming this would be to post-process the NA
##D ## predictions into a statistic of centrality
##D resN <- performanceEstimation(
##D   PredTask(a1 ~ .,algae[,1:12],"alga1"),
##D   Workflow(learner="svm",post="na2central"),
##D   EstimationTask(metrics="mse")
##D   )
##D summary(getIterationPreds(resN,1,1,it=1))
##D 
##D ## because the SVM also predicts negative values which does not make
##D ## sense in this application (the target are frequencies thus >= 0) we
##D ## could also include some further post-processing to take care of
##D ## negative predictions
##D resN <- performanceEstimation(
##D   PredTask(a1 ~ .,algae[,1:12],"alga1"),
##D   Workflow(learner="svm",post=c("na2central","onlyPos")),
##D   EstimationTask(metrics="mse")
##D   )
##D summary(getIterationPreds(resN,1,1,it=1))
##D 
##D ######################
##D ## An example with utility maximization learning for the
##D ## BreastCancer data set on package mlbench
##D ##
##D data(BreastCancer,package="mlbench")
##D 
##D ## First lets create the cost-benefit matrix
##D cb <- matrix(c(1,-10,-100,100),byrow=TRUE,ncol=2)
##D colnames(cb) <- paste("p",levels(BreastCancer$Class),sep=".")
##D rownames(cb) <- paste("t",levels(BreastCancer$Class),sep=".")
##D 
##D ## This leads to the following cost-benefit matrix
##D ##             p.benign p.malignant
##D ## t.benign           1         -10
##D ## t.malignant     -100         100
##D 
##D ## Now the performance estimation. We are estimating error rate (wrong
##D ## for cost sensitive tasks!) and total utility of the model predictions
##D ## (the right thing to do here!)
##D library(rpart)
##D 
##D r <- performanceEstimation(
##D         PredTask(Class ~ .,BreastCancer[,-1],"breastCancer"),
##D         c(Workflow(wfID="rpart.cost",
##D                    learner="rpart",
##D                    post="maxutil",
##D                    post.pars=list(cb.matrix=cb)
##D                   ),
##D           Workflow(wfID="rpart",
##D                    learner="rpart",
##D                    predictor.pars=list(type="class")
##D                   )
##D           ),
##D          EstimationTask(
##D               metrics=c("err","totU"),
##D               evaluator.pars=list(benMtrx=cb,posClass="malignant"),
##D               method=CV(strat=TRUE)))
##D 
##D ## Analysing the results
##D rankWorkflows(r,maxs=c(FALSE,TRUE))
##D 
##D ## Visualizing them
##D plot(r)
##D 
## End(Not run)




