library(tabr)


### Name: phrase
### Title: Create a musical phrase
### Aliases: phrase phrase p

### ** Examples

phrase("c ec'g' ec'g'", "4 4 2") # no explicit string specification (not recommended)
phrase("c ec4g4 ec4g4", "4 4 2") # same as above
phrase("c b, c", "4. 8( 8)", "5 5 5") # direction implies hammer on
phrase("b2 c d", "4( 4)- 2", "5 5 5") # hammer and slide

phrase("c ec'g' ec'g'", "1 1 1", "5 432 432")
p("c ec'g' ec'g'", "1 1 1", "5 432 432") # same as above



