library(checkmate)


### Name: checkCharacter
### Title: Check if an argument is a vector of type character
### Aliases: checkCharacter check_character assertCharacter
###   assert_character testCharacter test_character expect_character

### ** Examples

testCharacter(letters, min.len = 1, any.missing = FALSE)
testCharacter(letters, min.chars = 2)
testCharacter("example", pattern = "xa")



