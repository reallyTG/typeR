library(qdapRegex)


### Name: rm_bracket
### Title: Remove/Replace/Extract Brackets
### Aliases: rm_bracket rm_round rm_square rm_curly rm_angle
###   rm_bracket_multiple ex_bracket ex_bracket_multiple ex_angle ex_round
###   ex_square ex_curly
### Keywords: bracket

### ** Examples

examp <- structure(list(person = structure(c(1L, 2L, 1L, 3L),
    .Label = c("bob", "greg", "sue"), class = "factor"), text =
    c("I love chicken [unintelligible]!",
    "Me too! (laughter) It's so good.[interrupting]",
    "Yep it's awesome {reading}.", "Agreed. {is so much fun}")), .Names =
    c("person", "text"), row.names = c(NA, -4L), class = "data.frame")

examp
rm_bracket(examp$text, pattern = "square")
rm_bracket(examp$text, pattern = "curly")
rm_bracket(examp$text, pattern = c("square", "round"))
rm_bracket(examp$text)

ex_bracket(examp$text, pattern = "square")
ex_bracket(examp$text, pattern = "curly")
ex_bracket(examp$text, pattern = c("square", "round"))
ex_bracket(examp$text, pattern = c("square", "round"), merge = FALSE)
ex_bracket(examp$text)
ex_bracket(examp$tex, include.markers=TRUE)

## Not run: 
##D library(qdap)
##D ex_bracket(examp$tex, pattern="curly") %>% 
##D   unlist() %>% 
##D   na.omit() %>% 
##D   paste2()
## End(Not run)

x <- "I like [bots] (not). And <likely> many do not {he he}"

rm_round(x)
ex_round(x)
ex_round(x, include.marker = TRUE)

rm_square(x)
ex_square(x)

rm_curly(x)
ex_curly(x)

rm_angle(x)
ex_angle(x)

lapply(ex_between('She said, "I am!" and he responded..."Am what?".', 
    left='"', right='"'), "[", c(TRUE, FALSE))



