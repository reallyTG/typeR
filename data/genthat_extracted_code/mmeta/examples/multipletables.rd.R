library(mmeta)


### Name: multipletables
### Title: Exact posterior inference based on multiple 2x2 tables
### Aliases: multipletables
### Keywords: multipletables

### ** Examples

#library(mmeta)
#Analyze the dataset colorectal to conduct exact inference of the odds ratios
#data(colorectal)
#multiple.OR <- multipletables(data=colorectal, measure="OR",
# model="Sarmanov", method="exact")
#summary(multiple.OR)
# Generate the forest plot with 95% CIs of study-specific odds ratios
#and 95% CI of overall odds ratio
#plot(multiple.OR, type="forest", addline=1,file="forestOR")
# Plot the posterior density functions of some target studies in an overlaying manner
#plot(multiple.OR, type="overlap", select=c(4,14,16,20),file="overlapOR")
# Plot the posterior density functions of some target studies in a
#side-by-side manner 
#plot(multiple.OR, type="sidebyside", select=c(4,14,16,20), ylim=c(0,2.7),
# xlim=c(0.5,1.5),file="sidebysideOR")
#print(multiple.OR.table)
#print(multiple.OR.table, type="html")

# Analyze the dataset withdrawal to conduct inference of the relative risks
#data(withdrawal)
#multiple.RR <- multipletables(data=withdrawal, measure="RR",
#                              model="Sarmanov")
#summary(multiple.RR)
#plot(multiple.RR, type="forest", addline=1)
#plot(multiple.RR, type="overlap", select=c(3,8,14,16))
#plot(multiple.RR, type="sidebyside", select=c(3,8,14,16), 
#ylim=c(0,1.2), xlim=c(0.4,3))
#print(multiple.RR.table)
#print(multiple.RR.table, type="html")

# Analyze the dataset withdrawal to conduct inference of the risk differences
#data(withdrawal)
#multiple.RD <- multipletables(data=withdrawal, measure="RD",
#                             model="Sarmanov")
#summary(multiple.RD)
#plot(multiple.RD, type="forest", addline=0)
#plot(multiple.RD, type="overlap", select=c(3,8,14,16))
#plot(multiple.RD, type="sidebyside", select=c(3,8,14,16))
#plot(multiple.RD, type="sidebyside", select=c(3,8,14,16),
#     ylim=c(0,6), xlim=c(-0.2,0.4))
#print(multiple.RD.table)
#print(multiple.RD.table, type="html")



