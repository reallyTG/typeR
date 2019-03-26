library(FastImputation)


### Name: TrainFastImputation
### Title: Learn from the training data so that later you can fill in
###   missing data
### Aliases: TrainFastImputation

### ** Examples


data(FI_train)   # provides FI_train dataset

patterns_with_constraints <- TrainFastImputation(
  FI_train,
  constraints=list(list("bounded_below_2", list(lower=0)),
                   list("bounded_above_5", list(upper=0)),
                   list("bounded_above_and_below_6", list(lower=0, upper=1))
                   ),
  idvars="user_id_1",
  categorical="categorical_9")
  



