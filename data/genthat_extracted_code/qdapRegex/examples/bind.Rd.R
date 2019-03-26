library(qdapRegex)


### Name: bind
### Title: Add Left/Right Character(s) Boundaries
### Aliases: bind

### ** Examples

bind(LETTERS, "[", "]")

## More useful default parameters/usage
x <- c("Computer is fun. Not too fun.", "No it's not, it's dumb.", 
    "What should we do?", "You liar, it stinks!", "I am telling the truth!", 
    "How can we be certain?", "There is no way.", "I distrust you.", 
    "What are you talking about?", "Shall we move on?  Good then.", 
    "I'm hungry.  Let's eat.  You already?")

Fry25 <- c("the", "of", "and", "a", "to", "in", "is", "you", "that", "it", 
    "he", "was", "for", "on", "are", "as", "with", "his", "they", 
    "I", "at", "be", "this", "have", "from")

gsub(pastex(list(bind(Fry25))), "[[ELIM]]", x)



