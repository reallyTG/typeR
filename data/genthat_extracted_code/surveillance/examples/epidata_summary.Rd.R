library(surveillance)


### Name: epidata_summary
### Title: Summarizing an Epidemic
### Aliases: summary.epidata print.summary.epidata
### Keywords: methods

### ** Examples

data("fooepidata")
s <- summary(fooepidata)
s          # uses the print method for summary.epidata
names(s)   # components of the list 's'

# positions of the individuals
plot(s$coordinates)

# events by id
head(s$byID)



