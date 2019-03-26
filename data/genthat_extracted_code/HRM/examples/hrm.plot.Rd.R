library(HRM)


### Name: hrm.plot
### Title: Plots profiles of the groups in case of one whole- and one
###   subplot-factor.
### Aliases: hrm.plot
### Keywords: internal

### ** Examples

data(EEG)
head(EEG)

# plots profiles according to groups with
# subplot-factor called dimension

# first create an HRM object
object_hrm <- hrm_test(value ~ group*dimension, subject = "subject", data = EEG)

# plot the HRM object, here we use the additional argument 'theme_bw()' for ggplot2
plot(object_hrm, legend = TRUE, legend.title = "Group", ... =  theme_bw() )

# same plot without a legend
# note that 'theme_bw' overwrites the standard legend properties of plot.HRM
plot(object_hrm, ... =  theme_bw() +
  theme(legend.title = element_blank(), legend.position="none") )



