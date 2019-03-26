library(qdap)


### Name: random_sent
### Title: Generate Random Dialogue Data
### Aliases: random_sent random_data
### Keywords: random sample sentence

### ** Examples

## Not run: 
##D random_sent()
##D random_sent(200, 10)
##D 
##D dict <- sort(unique(bag_o_words(pres_debates2012[["dialogue"]])))
##D random_sent(dictionary=dict)
##D 
##D random_data()
##D random_data(ages = seq(10, 20, by = .5))
##D random_data(50) %&% word_stats(person)
##D random_data(100) %&% word_stats(list(race, sex))
##D random_data(dictionary = dict)
## End(Not run)



