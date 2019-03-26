## ------------------------------------------------------------------------
library(heuristica)

## ------------------------------------------------------------------------
data_set <- city_population_original
criterion_col <- 3    # Population
cols_to_fit <- 4:ncol(data_set) # The 9 cues

reg <- regInterceptModel(data_set, criterion_col, cols_to_fit)
ttb <- ttbModel(data_set, criterion_col, cols_to_fit)
unit <- unitWeightModel(data_set, criterion_col, cols_to_fit)
min <- minModel(data_set, criterion_col, cols_to_fit)

## ------------------------------------------------------------------------
out <- percentCorrectList(data_set, list(reg, ttb, unit, min))
# Round values to make comparison easier.
round(out)

