## ---- eval = TRUE, results='asis'----------------------------------------

  library("classiFunc")
  
  # classification of the ArrowHead data set
  data("ArrowHead", package = "classiFunc")
  classes = ArrowHead[,"target"]
  
  set.seed(123)
  # use 80% of data as training set and 20% as test set
  train_inds = sample(1:nrow(ArrowHead), size = 0.8 * nrow(ArrowHead), replace = FALSE)
  test_inds = (1:nrow(ArrowHead))[!(1:nrow(ArrowHead)) %in% train_inds]
  
  # create functional data as matrix with observations as rows
  fdata = ArrowHead[,!colnames(ArrowHead) == "target"]
  
  # create a k = 3 nearest neighbor classifier with Euclidean distance (default) of the
  # first order derivative of the data
  mod = classiKnn(classes = classes[train_inds], fdata = fdata[train_inds,],
                  nderiv = 1L, knn = 3L)
  # or create a kernel estimator with the global maxima distance proposed in Fuchs et al. 2016
  # check available semimetrics
  metricChoices()
  # create model
  mod2 = classiKernel(classes = classes[train_inds], fdata = fdata[train_inds,],
                      metric = "globMax")
  
  # predict the class labels for the test set
  pred = predict(mod, newdata =  fdata[test_inds,])
  
  # compute mean misclassification error
  mmcerr = mean(pred != classes[test_inds])
  
  # matrix with the prediction probabilities for the three classes
  pred.prob = predict(mod, newdata =  fdata[test_inds,], predict.type = "prob")
  

## ---- eval = FALSE, results='asis'---------------------------------------
#  # Parallelize across 2 CPUs
#  library("parallelMap")
#  
#  # set up parallelization
#  parallelStartSocket(cpus = 2L) # parallelStartMulticore(cpus = 2L) for Linux
#  
#  # predict in parallel
#  # specify parallel = TRUE and batchsize > 1L for parallelization
#  pred.parallel = predict(mod, newdata =  fdata[test_inds,], predict.type = "prob", parallel = TRUE, batches = 2L)
#  
#  # clean up parallelization
#  parallelStop()
#  
#  # results do not change
#  all(pred.parallel == pred.prob)
#  

## ---- eval = FALSE, results='asis'---------------------------------------
#  
#  # download and install the mlr branch containing the classiFunc learners
#  # devtools::install_github("maierhofert/mlr",
#  #                          ref = "classiFunc")
#  library("mlr")
#  
#  # classification of the ArrowHead data set
#  data("ArrowHead", package = "classiFunc")
#  # get the ArrowHead data into the functional data format of mlr
#  fArrowHead = makeFunctionalData(ArrowHead, exclude.cols = "target")
#  
#  set.seed(123)
#  # use 80% of data as training data and 20% as test data
#  train_inds = sample(1:nrow(ArrowHead), size = 0.8 * nrow(ArrowHead), replace = FALSE)
#  test_inds = (1:nrow(ArrowHead))[!(1:nrow(ArrowHead)) %in% train_inds]
#  
#  
#  # create the classiKnn learner for classification of functional data
#  lrn = makeLearner("classif.classiFunc.knn", knn = 3)
#  
#  # create a task from the training data
#  task = makeClassifTask(data = fArrowHead[train_inds,], target = "target")
#  # train the model on the training data task
#  m.mlr = train(lrn, task)
#  
#  # predict the test data
#  pred = predict(m.mlr, newdata = fArrowHead[test_inds,])
#  measureMMCE(ArrowHead[test_inds, "target"], pred$data$response)
#  
#  

## ---- eval = FALSE, results='asis'---------------------------------------
#  
#  # create the classiKernel learner for classification of functional data
#  lrn.kernel = makeLearner("classif.classiFunc.kernel", predict.type = "prob")
#  
#  # create parameter set
#  parSet.bandwidth = makeParamSet(
#    makeNumericParam(id = "h", lower = -5, upper = 5, trafo = function(x) 10 ^ x)
#  )
#  
#  # control for tuning hyper parameters
#  # use higher resolution in application
#  ctrl = makeTuneControlGrid(resolution = 15L)
#  
#  # create the tuned learner
#  lrn.bandwidth.tuned = makeTuneWrapper(learner = lrn.kernel,
#                                        resampling = makeResampleDesc("CV", iters = 5),
#                                        measures = mmce,
#                                        par.set = parSet.bandwidth,
#                                        control = ctrl)
#  
#  # train the model on the training data task
#  m.kern = train(lrn.bandwidth.tuned, task)
#  
#  # predict the test data set
#  pred.kern = predict(m.kern, newdata = fArrowHead[test_inds,])
#  measureMMCE(ArrowHead[test_inds, "target"], pred.kern$data$response)
#  
#  

## ---- eval = FALSE, results='asis'---------------------------------------
#  
#  # create the base learners
#  b.lrn1 = makeLearner("classif.classiFunc.knn",
#                       id = "Manhattan.lrn",
#                       par.vals = list(metric = "Manhattan"),
#                       predict.type = "prob")
#  b.lrn2 = makeLearner("classif.classiFunc.knn",
#                       id = "mean.lrn",
#                       par.vals = list(metric = "mean"),
#                       predict.type = "prob")
#  b.lrn3 = makeLearner("classif.classiFunc.knn",
#                       id = "globMax.lrn",
#                       par.vals = list(metric = "globMax"),
#                       predict.type = "prob")
#  
#  set.seed(123)
#  
#  # create an ensemble learner as porposed in Fuchs et al. (2015)
#  # the default uses leave-one-out CV to estimate the weights of the base learners as proposed in the original paper
#  # set resampling to CV for faster run time.
#  ensemble.lrn = makeStackedLearner(base.learners = list(b.lrn1, b.lrn2, b.lrn3),
#                                    predict.type = "prob",
#                                    resampling = makeResampleDesc("CV", iters = 10L),
#                                    method = "classif.bs.optimal")
#  
#  # create another ensemble learner using random forest as a super learner
#  rf.ensemble.lrn = makeStackedLearner(base.learners = list(b.lrn1, b.lrn2, b.lrn3),
#                                       super.learner = "classif.randomForest",
#                                       predict.type = "prob",
#                                       method = "stack.cv")
#  
#  # train the models on the training data task
#  ensemble.m = train(ensemble.lrn, task)
#  rf.ensemble.m = train(rf.ensemble.lrn, task)
#  
#  # predict the test data set
#  ensemble.pred = predict(ensemble.m, newdata = fArrowHead[test_inds,])
#  rf.ensemble.pred = predict(rf.ensemble.m, newdata = fArrowHead[test_inds,])
#  
#  # compute mean misclassification error
#  measureMMCE(ArrowHead[test_inds, "target"], ensemble.pred$data$response)
#  measureMMCE(ArrowHead[test_inds, "target"], rf.ensemble.pred$data$response)
#  

