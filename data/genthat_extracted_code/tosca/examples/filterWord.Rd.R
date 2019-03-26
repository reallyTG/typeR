library(tosca)


### Name: filterWord
### Title: Subcorpus With Word Filter
### Aliases: filterWord

### ** Examples

texts <- list(A="Give a Man a Fish, and You Feed Him for a Day.
Teach a Man To Fish, and You Feed Him for a Lifetime",
B="So Long, and Thanks for All the Fish",
C="A very able manipulative mathematician, Fisher enjoys a real mastery
in evaluating complicated multiple integrals.")

# search for pattern "fish"
filterWord(text=texts, search="fish", ignore.case=TRUE)

# search for word "fish"
filterWord(text=texts, search=data.frame(pattern="fish", word="word", count=1),
ignore.case=TRUE)

# pattern must appear at least two times
filterWord(text=texts, search=data.frame(pattern="fish", word="pattern", count=2),
ignore.case=TRUE)

# search for "fish" AND "day"
filterWord(text=texts, search=data.frame(pattern=c("fish", "day"), word="word", count=1),
ignore.case=TRUE)

# search for "Thanks" OR "integrals"
filterWord(text=texts, search=list(data.frame(pattern="Thanks", word="word", count=1),
data.frame(pattern="integrals", word="word", count=1)))





