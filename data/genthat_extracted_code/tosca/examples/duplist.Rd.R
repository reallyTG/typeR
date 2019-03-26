library(tosca)


### Name: duplist
### Title: Creating List of Duplicates
### Aliases: duplist is.duplist print.duplist summary.duplist
### Keywords: manip

### ** Examples

texts <- list(A="Give a Man a Fish, and You Feed Him for a Day.
Teach a Man To Fish, and You Feed Him for a Lifetime",
A="A fake duplicate",
B="So Long, and Thanks for All the Fish",
B="So Long, and Thanks for All the Fish",
C="A very able manipulative mathematician, Fisher enjoys a real mastery
in evaluating complicated multiple integrals.",
C="A very able manipulative mathematician, Fisher enjoys a real mastery
in evaluating complicated multiple integrals.")

corpus <- textmeta(meta=data.frame(id=c("A", "A", "B", "B", "C", "C"),
title=c("Fishing", "Fake duplicate", "Don't panic!", "towel day", "Sir Ronald", "Sir Ronald"),
date=c("1885-01-02", "1885-01-03", "1979-03-04", "1979-03-05", "1951-05-06", "1951-05-06"),
stringsAsFactors=FALSE), text=texts)

duplicates <- deleteAndRenameDuplicates(object=corpus)
duplist(object=duplicates, paragraph = FALSE)



