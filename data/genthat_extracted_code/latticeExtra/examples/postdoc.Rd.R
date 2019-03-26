library(latticeExtra)


### Name: postdoc
### Title: Reasons for Taking First Postdoctoral Appointment
### Aliases: postdoc
### Keywords: datasets

### ** Examples

data(postdoc)
library(lattice)
barchart(prop.table(postdoc, margin = 1),
         auto.key = TRUE, xlab = "Proportion")



