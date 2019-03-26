library(tosca)


### Name: filterCount
### Title: Subcorpus With Count Filter
### Aliases: filterCount

### ** Examples

texts <- list(A="Give a Man a Fish, and You Feed Him for a Day.
Teach a Man To Fish, and You Feed Him for a Lifetime",
B="So Long, and Thanks for All the Fish",
C="A very able manipulative mathematician, Fisher enjoys a real mastery
in evaluating complicated multiple integrals.")

filterCount(text=texts, count=10L)

filterCount(text=texts, count=10L, out="bin")

filterCount(text=texts, count=10L, out="count")



