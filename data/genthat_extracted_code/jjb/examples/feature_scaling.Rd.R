library(jjb)


### Name: feature_scaling
### Title: Feature Scaling
### Aliases: feature_scaling feature_rescale feature_derescale feature_norm
###   feature_denorm feature_standardize feature_destandardize

### ** Examples


# Rescaling Features
temperatures = c(94.2, 88.1, 32, 0)

temp_min = min(temperatures)
temp_max = max(temperatures)

temperatures_norm   = feature_rescale(temp_min, temp_max)
temperatures_denorm = feature_derescale(temperatures_norm, temp_min, temp_max)

all.equal(temperatures, temperatures_denorm)
 
# Norming Features
x = 1:10

x_norm = sqrt(sum(x^2))

x_norm_std = feature_norm(x, x_norm)

x_recover = feature_denorm(x_norm_std, x_norm)
all.equal(x, x_recover)

# Standardizing Features
x      = 1:10

x_mean = mean(x)
x_sd   = sd(x)

x_std  = feature_standardize(x, x_mean, x_sd)
x_recovery = feature_destandardize(x, x_mean, x_sd)

all.equal(x, x_recovery)



