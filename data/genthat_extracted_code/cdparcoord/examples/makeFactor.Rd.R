library(cdparcoord)


### Name: makeFactor
### Title: Change numeric variables factors.
### Aliases: makeFactor

### ** Examples

data(prgeng)
pe <- prgeng[,c(1,3,5,7:9)]
class(pe$educ)  # integer
pe <- makeFactor(pe,c('educ','occ','sex'))
class(pe$educ)  # factor
# nice to give levels names
levels(pe$sex) <- c('male','female')
head(pe$sex)



