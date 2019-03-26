library(Hmisc)


### Name: translate
### Title: Translate Vector or Matrix of Text Strings
### Aliases: translate
### Keywords: character

### ** Examples

translate(c("ABC","DEF"),"ABCDEFG", "abcdefg")
translate("23.12","[.]","\\cdot ") # change . to \cdot
translate(c("dog","cat","tiger"),c("dog","cat"),c("DOG","CAT"))
# S-Plus gives  [1] "DOG"   "CAT"   "tiger" - check discrepency
translate(c("dog","cat2","snake"),c("dog","cat"),"animal")
# S-Plus gives  [1] "animal"  "animal2" "snake" 



