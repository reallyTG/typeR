library(gdata)


### Name: startsWith
### Title: Determine if a character string "starts with" with the specified
###   characters.
### Aliases: startsWith
### Keywords: character

### ** Examples

## simplest example:
startsWith( 'Testing', 'Test')

## vector examples
s <- c('Testing', ' Testing', 'testing', 'Texting')
names(s) <- s

startsWith(s, 'Test')                   # ' Testing', 'testing', and 'Texting' do not match
startsWith(s, 'Test', trim=TRUE)        # Now ' Testing' matches
startsWith(s, 'Test', ignore.case=TRUE) # Now 'testing' matches



