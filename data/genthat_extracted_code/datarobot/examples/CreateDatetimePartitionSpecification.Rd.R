library(datarobot)


### Name: CreateDatetimePartitionSpecification
### Title: Create a list describing datetime partition parameters
### Aliases: CreateDatetimePartitionSpecification

### ** Examples

CreateDatetimePartitionSpecification("date_col")
CreateDatetimePartitionSpecification("date",
                                     featureSettings = list(
                                       list("featureName" = "Product_offers",
                                            "defaultToKnownInAdvance" = TRUE)))
partition <- CreateDatetimePartitionSpecification("dateColumn",
                                                treatAsExponential = TreatAsExponential$Always,
                                                differencingMethod = DifferencingMethod$Seasonal,
                                                periodicities = list(list("timeSteps" = 10,
                                                                          "timeUnit" = "HOUR"),
                                                                     list("timeSteps" = 600,
                                                                          "timeUnit" = "MINUTE"),
                                                                     list("timeSteps" = 7,
                                                                          "timeUnit" = "DAY")))



