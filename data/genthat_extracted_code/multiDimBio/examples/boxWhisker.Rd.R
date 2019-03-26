library(multiDimBio)


### Name: boxWhisker
### Title: A function to create a box and whisker plot by group ID
### Aliases: boxWhisker

### ** Examples

data(Nuclei)
data(Groups)
boxWhisker(Nuclei, Groups)

#changing the color palette

boxWhisker(data = Nuclei, groups = Groups, palette = 'Set1')



