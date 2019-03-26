library(FDboost)


### Name: emotion
### Title: EEG and EMG recordings in a computerised gambling study
### Aliases: emotion
### Keywords: datasets

### ** Examples

data("emotion", package = "FDboost")

# fit function-on-scalar model with random effect and power effect
fos_random_power <- FDboost(EMG ~ 1 + brandomc(subject, df = 2)
                            + bolsc(power, df = 2),
                            timeformula = ~ bbs(t, df = 3),
                            data = emotion)
## Not run: 
##D                             
##D # fit function-on-function model with intercept and historical EEG effect
##D # where limits specifies the used lag between EMG and EEG signal
##D fof_historical <- FDboost(EMG ~ 1 + bhist(EEG, s = s, time = t,
##D                           limits = function(s,t) s < t - 3),
##D                           timeformula = ~ bbs(t, df = 3), data = emotion,
##D                           control = boost_control(mstop = 200))                            
## End(Not run)



