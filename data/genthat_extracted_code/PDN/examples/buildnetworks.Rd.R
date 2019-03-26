library(PDN)


### Name: buildnetworks
### Title: Generating Network Matrix
### Aliases: buildnetworks

### ** Examples

# Select a subset of data for toy example
comorbidity_data = comorbidity_data[c(1:10),]
survival_data = survival_data[c(1:10),]
k1 = datecut(comorbidity_data,survival_data[,1],survival_data[,2])
a = buildnetworks(comorbidity_data,k1)



