load_lhc_training_data <- function()
{
  parameters<-c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
                "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope")
  measures<-c("Velocity","Displacement")
  sampleMaxes <- cbind(100,0.9,0.5,0.08,1,5)
  sampleMins <-cbind(0,0.1,0.1,0.015,0.1,0.25)
  data("sim_data_for_emulation")
  # Test failed if sim_data_for_emulation was not returned as an object
  testDataset<-sim_data_for_emulation

  return(list("dataset"=testDataset,"parameters"=parameters,"sample_maxes"=sampleMaxes,"sample_mins"=sampleMins,"measures"=measures))
}
