library(mmeta)


### Name: summary.multipletables
### Title: Summary a specific study of objects 'multipletables'
### Aliases: summary.multipletables
### Keywords: methods

### ** Examples

#library(mmeta)

# Analyze the dataset colorectal to conduct exact inference of the odds ratios
#data(colorectal)
#multiple.OR <- multipletables(data=colorectal, measure="OR", model="Sarmanov", method="exact")
# Generate the forest plot with 95% CIs of study-specific odds ratios
#and 95% CI of overall odds ratio
#plot(multiple.OR, type="forest", addline=1)
# Plot the posterior density functions of some target studies in an overlaying manner
#plot(multiple.OR, type="overlap", select=c(4,14,16,20))
# Plot the posterior density functions of some target studies in a
#side-by-side manner 
#plot(multiple.OR, type="sidebyside", select=c(4,14,16,20), ylim=c(0,2.7), xlim=c(0.5,1.5))


# Analyze the dataset withdrawal to conduct inference of the relative risks
#data(withdrawal)
#multiple.RR <- multipletables(data=withdrawal, measure="RR",model="Sarmanov")
#plot(multiple.RR, type="forest", addline=1)
#plot(multiple.RR, type="overlap", select=c(3,8,14,16))
#plot(multiple.RR, type="sidebyside", select=c(3,8,14,16), ylim=c(0,1.2),
#xlim=c(0.4,3))

# Analyze the dataset withdrawal to conduct inference of the risk differences
#data(withdrawal)
#multiple.RD <- multipletables(data=withdrawal, measure="RD",
#                              model="Sarmanov")
#summary(multiple.RD)
#plot(multiple.RD, type="forest", addline=0)
#plot(multiple.RD, type="overlap", select=c(3,8,14,16))
#plot(multiple.RD, type="sidebyside", select=c(3,8,14,16))
#plot(multiple.RD, type="sidebyside", select=c(3,8,14,16),
#     ylim=c(0,6), xlim=c(-0.2,0.4))



