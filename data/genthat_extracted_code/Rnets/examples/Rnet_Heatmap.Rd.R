library(Rnets)


### Name: Rnet_Heatmap
### Title: Rnet_Heatmap - Function to generate a bitmap figure to represent
###   edges in similar networks over time.
### Aliases: Rnet_Heatmap

### ** Examples

#Example using EC_Rnets_byYear
EC_Rnets_byYear <- Rnet(x = NARMS_EC_DATA, 
						L1 = 0.25, 
						vert = c('AMP', 'AMC', 'AXO', 'TIO', 'NAL', 
						  'CIP', 'STR', 'GEN', 'COT', 'FIS', 'AZI'), 
						n_min = 20,
					subset = 'Year'
						)

EC_Heatmap <- Rnet_Heatmap(EC_Rnets_byYear, e_cuts = c(0, 0.05, 0.1, 0.2, 1))

par(mar = c(4, 5, 1, 1)+0.1)
image(EC_Heatmap)



