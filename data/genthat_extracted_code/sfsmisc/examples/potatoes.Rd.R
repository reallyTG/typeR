library(sfsmisc)


### Name: potatoes
### Title: Fisher's Potato Crop Data
### Aliases: potatoes
### Keywords: datasets

### ** Examples

data(potatoes)
## See the experimental design:
with(potatoes, {
     cat("4 blocks of experiments;",
         "each does every (nitrogen,potash) combination (aka 'treat'ment) once.",
         '', sep="\n")
     print(ftable(table(nitrogen, potash, treat)))
     print(ftable(tt <- table(pos,potash,nitrogen)))
     tt[cbind(pos,potash,nitrogen)] <- as.character(treat)
     cat("The 4 blocks  pos = 1, 2, 3, 4:\n")
     ftable(tt)
     })
## First plot:
with(potatoes, interaction.plot(potash,nitrogen, response=yield))

## ANOVAs:
summary(aov(yield ~ nitrogen * potash + Error(pos), data = potatoes))
    # "==>" can use simply
summary(aov(yield ~ nitrogen + potash + pos, data = potatoes))
    # and
summary(aov(yield ~ nitrogen + potash, data = potatoes))



