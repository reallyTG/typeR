library(polyRAD)


### Name: PipelineMapping2Parents
### Title: Run polyRAD Pipeline on a Mapping Population
### Aliases: PipelineMapping2Parents
### Keywords: misc

### ** Examples

# load data for the example
data(exampleRAD_mapping)

# specify donor and recurrent parents
exampleRAD_mapping <- SetDonorParent(exampleRAD_mapping, "parent1")
exampleRAD_mapping <- SetRecurrentParent(exampleRAD_mapping, "parent2")

# run the pipeline
exampleRAD_mapping <- PipelineMapping2Parents(exampleRAD_mapping,
                                 n.gen.backcrossing = 1)
                                 
# export results
wmgeno <- GetWeightedMeanGenotypes(exampleRAD_mapping)[-(1:2),]
wmgeno



