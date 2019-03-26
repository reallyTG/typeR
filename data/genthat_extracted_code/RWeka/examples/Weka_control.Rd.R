library(RWeka)


### Name: Weka_control
### Title: Control Weka Options
### Aliases: Weka_control print.Weka_control as.character.Weka_control
### Keywords: documentation

### ** Examples

## Query J4.8 options:
WOW("J48")
## Learn J4.8 tree on iris data with default settings:
J48(Species ~ ., data = iris)
## Learn J4.8 tree with reduced error pruning (-R) and 
## minimum number of instances set to 5 (-M 5):
J48(Species ~ ., data = iris, control = Weka_control(R = TRUE, M = 5))



