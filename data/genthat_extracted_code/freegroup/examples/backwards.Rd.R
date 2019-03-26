library(freegroup)


### Name: backwards
### Title: Write free objects backwards
### Aliases: backwards

### ** Examples

backwards(abc(1:5))
rev(abc(1:5))

x <- rfree(10,5)
all(abelianize(x) == abelianize(backwards(x)))




