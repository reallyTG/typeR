library(qdapRegex)


### Name: rm_between
### Title: Remove/Replace/Extract Strings Between 2 Markers
### Aliases: rm_between rm_between_multiple ex_between ex_between_multiple

### ** Examples

x <-  "I like [bots] (not)."

rm_between(x, "(", ")")
ex_between(x, "(", ")")
rm_between(x, c("(", "["), c(")", "]"))
ex_between(x, c("(", "["), c(")", "]"))

rm_between(x, c("(", "["), c(")", "]"), include.markers=FALSE)
ex_between(x, c("(", "["), c(")", "]"), include.markers=TRUE) 

## multiple (naming and ability to keep separate bracket types but slower)
x <- c("Where is the /big dog#?",
    "I think he's @arunning@b with /little cat#.")

rm_between_multiple(x, "@a", "@b")
ex_between_multiple(x, "@a", "@b")
rm_between_multiple(x, c("/", "@a"), c("#", "@b"))
ex_between_multiple(x, c("/", "@a"), c("#", "@b"))

x2 <- c("Where is the L1big dogL2?",
    "I think he's 98running99 with L1little catL2.")
rm_between_multiple(x2, c("L1", 98), c("L2", 99))
ex_between_multiple(x2, c("L1", 98), c("L2", 99))

state <- c("Computer is fun. Not too fun.", "No it's not, it's dumb.", 
    "What should we do?", "You liar, it stinks!", "I am telling the truth!", 
    "How can we be certain?", "There is no way.", "I distrust you.", 
    "What are you talking about?", "Shall we move on?  Good then.", 
    "I'm hungry.  Let's eat.  You already?")

rm_between_multiple(state, c("is", "we"), c("too", "on"))

## Use Grouping
s <- "something before stuff $some text$ in between $1$ and after"
rm_between(s, "$", "$", replacement="<B>\\2<E>")

## Using regular expressions as boundaries (fixed =FALSE)
x <-  c(
    "There are 2.3 million species in the world",
    "There are 2.3 billion species in the world"
)

ex_between(x, left='There', right = '[mb]illion', fixed = FALSE, include=TRUE)



