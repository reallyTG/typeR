## ---- eval=FALSE---------------------------------------------------------
#  data("ml100k")

## ---- eval=FALSE---------------------------------------------------------
#  data("mlLatest100k")

## ---- eval=FALSE---------------------------------------------------------
#  ML <- defineData(mlLatest100k, minimum = .5, maximum = 5, intScale = TRUE)
#  ML
#  ## Dataset containing 718 users and  8927 items and a total of  100234  scores.

## ---- eval=FALSE---------------------------------------------------------
#  binML <- defineData(mlLatest100k, binary = TRUE, positiveThreshold = 3)
#  binML
#  ## Binary dataset containing 718 users and  8927 items and a total of  84326  scores.

## ---- eval=FALSE---------------------------------------------------------
#  # Number of times an item was rated.
#  colRatings(ML)
#  # Number of times a user has rated.
#  rowRatings(ML)
#  # Total number of rating in the rating matrix.
#  numRatings(ML)
#  # Sparsity.
#  sparsity(ML)

## ---- eval=FALSE---------------------------------------------------------
#  # Removing users that rated less than 40 items and items that were rated less than 30 times.
#  subML <- ML[rowRatings(ML)>=40, colRatings(ML)>=30]
#  sparsity(ML)
#  sparsity(subML)

