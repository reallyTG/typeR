## this is the function used by NSGAII to evaluate the ouputs of the neural network
## This is specific to the case study, in this case being the Peyer's Patch simulation in our paper
## inputs:     parameter values, scaled between zero and one
## outputs:    cell velocity, displacement and patch area
## objectives: minimise the rmse between nnet and exptl values for cell velocity and displacement
##             minimise path size or inverse patch size
evalfunction <- function(params,nsga2_user_set_parameters){
  input <- as.data.frame(rbind(params))
  colnames(input) <- nsga2_user_set_parameters$parameters

  # nsgaii will input the parameters between zero and one
  # generate the neural network predictions
  pr <- use_ensemble_to_generate_predictions(nsga2_user_set_parameters$emulator, input, nsga2_user_set_parameters$parameters,
                                             nsga2_user_set_parameters$measures, normalise_values=TRUE, normalise_result=TRUE)

  # we are only evaluating one set of 3 outputs at a time and not a dataframe of outputs
  # so dont need the apply function here.
  velocity_prediction <- pr[,1]
  displacement_prediction <- pr[,2]
  size_prediction <- pr[,3]
  #output the rmse between the nnet prediction and the in vivo measures.
  output <- c()
  output[1] <- meanSquaredError(nsga2_user_set_parameters$desiredResponses[1],velocity_prediction)
  output[2] <- meanSquaredError(nsga2_user_set_parameters$desiredResponses[2],displacement_prediction)

  #if we want to minimise we use size_prediction
  # if we want to maximise we use negative value of sizeprediction, this is
  # because nsgaii default is to minimise the objectives
  # might be possible to change in nsgaii inputs...
  output[3] <- -size_prediction
  return(output)
}
