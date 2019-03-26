library(metaBMA)


### Name: power_pose
### Title: Data Set: Power Pose Effect
### Aliases: power_pose power_pose_unfamiliar
### Keywords: datasets

### ** Examples

data(power_pose)
head(power_pose)

# Simple fixed-effects meta-analysis
mfix <- meta_fixed(power_pose$effectSize, power_pose$SE,
                   power_pose$study)
mfix
plot_posterior(mfix)



