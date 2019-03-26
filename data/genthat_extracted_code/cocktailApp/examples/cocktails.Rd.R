library(cocktailApp)


### Name: cocktails
### Title: Cocktails Data
### Aliases: cocktails
### Keywords: datasets

### ** Examples

data(cocktails)
str(cocktails)

require(dplyr)
cocktails %>%
	filter(short_ingredient %in% c('Averna','Bourbon')) %>%
	group_by(cocktail,url) %>%
		mutate(isok=n() > 1) %>%
	ungroup() %>%
	filter(isok) %>%
	arrange(desc(rating),cocktail) %>%
	select(cocktail,ingredient,amt,unit,rating) %>%
	head(n=8)




