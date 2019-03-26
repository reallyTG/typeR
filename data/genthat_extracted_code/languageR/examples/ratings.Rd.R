library(languageR)


### Name: ratings
### Title: Ratings for 81 English nouns
### Aliases: ratings
### Keywords: datasets

### ** Examples
## Not run: 
##D data(ratings)
##D 
##D ratings.lm = lm(meanSizeRating ~ meanFamiliarity * Class + 
##D I(meanFamiliarity^2), data = ratings)
##D 
##D ratings$fitted = fitted(ratings.lm)
##D 
##D plot(ratings$meanFamiliarity, ratings$meanSizeRating,       
##D xlab = "mean familiarity", ylab = "mean size rating", type = "n")
##D text(ratings$meanFamiliarity, ratings$meanSizeRating, 
##D substr(as.character(ratings$Class), 1, 1), col = 'darkgrey')
##D 
##D plants = ratings[ratings$Class == "plant", ]    
##D animals = ratings[ratings$Class == "animal", ]  
##D plants = plants[order(plants$meanFamiliarity),]
##D animals = animals[order(animals$meanFamiliarity),]
##D 
##D lines(plants$meanFamiliarity, plants$fitted)
##D lines(animals$meanFamiliarity, animals$fitted)
## End(Not run)


