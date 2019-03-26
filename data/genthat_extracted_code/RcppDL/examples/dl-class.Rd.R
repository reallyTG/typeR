library(RcppDL)


### Name: deeplearning-class
### Title: Class 'deeplearning' and sub-classes
### Aliases: deeplearning-class da-class dA Sda Rbm Dbn sda-class rbm-class
###   dbn-class Rcpp_Sda-class Rcpp_dA-class Rcpp_Rbm-class Rcpp_Dbn-class
###   class:deeplearning class:sda class:Rcpp_Sda class:da class:Rcpp_dA
###   summary,da-method CorruptionLevel,da-method TrainingEpochs,da-method
###   LearningRate,da-method HiddenRepresentation,da-method train,da-method
###   reconstruct,da,matrix-method setCorruptionLevel,da,numeric-method
###   setTrainingEpochs,da,numeric-method setLearningRate,da,numeric-method
###   setHiddenRepresentation,da,numeric-method summary,sda-method
###   CorruptionLevel,sda-method LearningRate,sda-method
###   PretrainLearningRate,sda-method PretrainingEpochs,sda-method
###   FinetuneEpochs,sda-method FinetuneLearningRate,sda-method
###   pretrain,sda-method finetune,sda-method predict,sda,matrix-method
###   setCorruptionLevel,sda,numeric-method
###   setFinetuneEpochs,sda,numeric-method
###   setFinetuneLearningRate,sda,numeric-method
###   setPretrainLearningRate,sda,numeric-method
###   setPretrainEpochs,sda,numeric-method summary,rbm-method
###   TrainingEpochs,rbm-method LearningRate,rbm-method
###   HiddenRepresentation,rbm-method Step,rbm-method train,rbm-method
###   reconstruct,rbm,matrix-method setStep,rbm,numeric-method
###   setHiddenRepresentation,rbm,numeric-method
###   setLearningRate,rbm,numeric-method
###   setTrainingEpochs,rbm,numeric-method summary,dbn-method
###   LearningRate,dbn-method PretrainLearningRate,dbn-method
###   PretrainingEpochs,dbn-method FinetuneEpochs,dbn-method
###   FinetuneLearningRate,dbn-method Step,dbn-method pretrain,dbn-method
###   finetune,dbn-method predict,dbn,matrix-method
###   setFinetuneEpochs,dbn,numeric-method
###   setFinetuneLearningRate,dbn,numeric-method setStep,dbn,numeric-method
###   setPretrainEpochs,dbn,numeric-method
###   setPretrainLearningRate,dbn,numeric-method
### Keywords: classes

### ** Examples

 data(test)
 sda_test <- Rsda(train_X, train_Y, hidden)
 summary(sda_test)
 LearningRate(sda_test)
 pretrain(sda_test)
 finetune(sda_test)
 predict(sda_test, test_X)



