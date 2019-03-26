## ------------------------------------------------------------------------
library(uwIntroStats)
data(mri)
regress("mean", atrophy ~ age + U(~packyrs + yrsquit), data = mri)

## ------------------------------------------------------------------------
regress("mean", atrophy ~ age + U(smoke = ~packyrs + yrsquit), data = mri)

