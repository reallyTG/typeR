library(hypergate)


### Name: hgate_sample
### Title: hgate_sample
### Aliases: hgate_sample

### ** Examples

# Standard procedure with downsampling
data(Samusik_01_subset)
xp <- Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels]
gate_vector <- Samusik_01_subset$labels
sampled <- hgate_sample(gate_vector, level=8, 100)
table(sampled)
table(gate_vector[sampled])
xp_sampled <- xp[sampled, ]
gate_vector_sampled <- gate_vector[sampled]
hg <- hypergate(xp_sampled, gate_vector_sampled, level=8, delta_add=0.01)
# cluster 8 consists in 122 events
table(gate_vector)
# Downsampling
table(gate_vector[hgate_sample(gate_vector, level=8, 100)])
# Downsampling reduces the alternate events
table(gate_vector[hgate_sample(gate_vector, level=8, 100, "10x")])
# Downsampling is limited to the maximum number of events of interest
table(gate_vector[hgate_sample(gate_vector, level=8, 150)])
# Downsampling is limited to the maximum number of events of interest, and
# the alternate events are downsampled to a total of 10 times
table(gate_vector[hgate_sample(gate_vector, level=8, 150, "10x")])
# More details about sampling
# Convert -1 to NA, NA are not sampled
gate_vector[gate_vector==-1] = NA
gate_vector = factor(gate_vector)
table(gate_vector, useNA = "alw")
#
# target size = 100 whereas initial freq is 122 for pop 8
smp.prop = hgate_sample(gate_vector, level = 8, size = 100, method = "prop")
smp.10x  = hgate_sample(gate_vector, level = 8, size = 100, method = "10x")
smp.ceil = hgate_sample(gate_vector, size = 10, method = "ceil")
table(smp.prop)
table(smp.10x)
table(smp.ceil)
rbind(raw = table(gate_vector),
      prop = table(gate_vector[smp.prop]),
      `10x` = table(gate_vector[smp.10x]),
      ceil = table(gate_vector[smp.ceil]))
#
# target size = 30 whereas initial freq is 25 for pop 14
smp.prop = hgate_sample(gate_vector, level = 14, size = 30, method = "prop")
smp.10x  = hgate_sample(gate_vector, level = 14, size = 30, method = "10x")
table(smp.prop)
table(smp.10x)
rbind(raw = table(gate_vector),
      prop = table(gate_vector[smp.prop]),
      `10x` = table(gate_vector[smp.10x]))
# prop returns original data, because target size ids larger than initial freq
# 10x  returns sampled data according to initial freq, such as the total amount
# of other events equals 10x initial freq of pop 14



