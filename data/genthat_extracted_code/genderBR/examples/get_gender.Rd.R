library(genderBR)


### Name: get_gender
### Title: Predict gender from Brazilian first names
### Aliases: get_gender

### ** Examples

# Use get_gender to predict the gender of a person based on her/his first name
get_gender('MARIA DA SILVA SANTOS')
get_gender('joao')

## Not run: 
##D # It is possible to filter results by state
##D get_gender('ana', state = 'sp')
##D 
##D # To change the employed threshold
##D get_gender('ariel', threshold = '0.8')
##D 
##D # Or to get the proportion of females
##D # with the name provided
##D get_gender('iris', prob = TRUE)
##D 
##D # Multiple names can be predict at the same time
##D get_gender(c('joao', 'ana', 'benedita', 'rafael'))
##D 
##D # In different states
##D get(rep('cris', 3), c('sp', 'am', 'rs'))
## End(Not run)




